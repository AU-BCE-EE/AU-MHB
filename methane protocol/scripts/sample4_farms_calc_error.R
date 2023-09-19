rm(list = ls())

library(readxl)
library(dplyr)
library(ggplot2)
library(purrr)
library(lubridate)

# import
dalby <- read.csv('../dat/dalby_2023.csv') %>% filter(!treatment %in% c("slurryfunnels","slurrytrays"))
dalby$time <- dalby$days
dalby$date <- ymd_hms(dalby$date)

# select control first
dat <- dalby[dalby$treatment == 'control',]
per <- read.csv('../dat/dalby_periods.csv')
per <- per[, -c(1)]
time_to_add <- hms("12:00:00")
dat$batch <- NA

for (i in 1:4){
  
    # create intervals for each batch
    assign(paste0('int', i), ymd_hms(dmy(per[i, c('date.in', 'date.out')]) + time_to_add))
    assign(paste0('int', i), map2(eval(parse(text = paste0('int', i,'[1]'))),
                                eval(parse(text = paste0('int', i,'[2]'))),
                                interval))
    # assign batch
    dat$batch[dat$date %within% eval(parse(text = paste0('int', i)))] <- i
  
}

# add weeks and phases withing each batch
dat <- dat %>% mutate(weeks = days/7) %>% filter(!is.na(batch)) %>% group_by(batch) %>%
  mutate(week_of_batch = floor(weeks - weeks[1]) + 1) %>%
  mutate(midbatch = round(max(week_of_batch)/2)) %>% 
  mutate(phase = ceiling(week_of_batch/midbatch)) %>% ungroup()

# create four different farms by scaling "dat" to emissions from a dataset of emission factors
# import reference emission sets, keep only Finisher pig data
ref <- read_excel('../dat/ref_emis.xlsx') %>% filter(animal == 'Finisher')

output <- data.frame()

error_fun <- function(dat){
  
  sampled_weeks <- dat %>% group_by(batch, phase) %>% summarise(weeks = sample(unique(week_of_batch), 1)) %>% 
    arrange(batch, weeks)
  
  meas_part_dat <- dat %>% group_by(batch, week_of_batch) %>%
    summarise(CH4 = mean(CH4_rate/pigs, na.rm = T)) %>% 
    group_by(batch) %>% 
    filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% ungroup() %>%
    summarise(CH4 = mean(CH4, na.rm = T), week = mean(week_of_batch))
  
  meas_full_dat <- dat %>% ungroup() %>% summarise(CH4 = mean(CH4_rate/pigs, na.rm = T))
  
  error <- (meas_part_dat$CH4/meas_full_dat$CH4 - 1) * 100 
  
  return(list(meas_part_dat = meas_part_dat$CH4, meas_full_dat = meas_full_dat$CH4,
              error = error, mean_week = meas_part_dat$week))
  
}

# repeat simulation 

n_sim <- 1000

for(campaign in 1:n_sim){

farms <- sample(ref$CH4, 4) # sample four emissions factors
dat_emis <- dat %>% summarise(emis = mean(CH4_rate/pigs, na.rm = T)) # get real measured emission for scaling dataset to farms
dat.scale <- dat # intermediate dataset

# create 4 datasets representing four farms 
for (i in 1:length(farms)){
  scale <- farms[i]/dat_emis$emis
  dat.scale$CH4_rate <- scale * (dat$CH4_rate)
  assign(paste0('dat', i), dat.scale)
}

# simulate the four farms and get outputs in sim
sim <- NULL
for(i in 1:4){
  farm <- eval(parse(text = paste0('dat',i)))
  sim <- rbind(sim, error_fun(dat = farm))
}

# bind sim and a simulation index
output1 <- cbind(sim, campaign)
output <- rbind(output, output1)

}

output <- as.data.frame(lapply(output, as.numeric))

stats_per_campaign <- output %>% group_by(campaign) %>% summarise(CH4_part = mean(as.numeric(meas_part_dat)), 
                                              CH4_full = mean(as.numeric(meas_full_dat)),
                                              error_campaign = mean(abs(as.numeric(error))), bias_campaign = mean(as.numeric(error)))

stats_per_1000_campaign <- stats_per_campaign %>% summarise(CH4_part = mean(CH4_part), 
                                             CH4_full = mean(CH4_full), 
                                             error_mean = mean(error_campaign), 
                                             error_sd = sd(error_campaign),
                                             bias = mean(bias_campaign))


write.xlsx(output, '../output/full_output.xlsx')
write.xlsx(stats_per_campaign, '../output/stats_campaign_level.xlsx')
write.xlsx(stats_per_1000_campaign, '../output/stats_overall.xlsx')

output <- read_excel('../output/full_output.xlsx') 
campaign <- read_excel('../output/stats_campaign_level.xlsx')
overall <- read_excel('../output/stats_overall.xlsx')

hist_full_output <- ggplot(output, aes(x = error)) +
  geom_histogram(binwidth = 1) + 
  theme_bw() + labs(x = "error, % from actual", y = "") + 
  theme(text = element_text(size = 14))

png('../plots/hist_all.png', height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(hist_full_output)
dev.off()

hist_campaign <- ggplot(campaign, aes(x = bias_campaign)) +
  geom_histogram(binwidth = 1) + 
  theme_bw() + labs(x = "mean error, % from actual", y = "") + 
  theme(text = element_text(size = 14))

png('../plots/hist_campaign.png', height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(hist_campaign)
dev.off()

