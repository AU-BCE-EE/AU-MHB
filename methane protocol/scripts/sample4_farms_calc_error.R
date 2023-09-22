rm(list = ls())

library(readxl)
library(dplyr)
library(ggplot2)
library(purrr)
library(lubridate)
library(openxlsx)

# import
dalby <- read.csv('../dat/dalby_2023.csv') %>% filter(!treatment %in% c("slurryfunnels","slurrytrays"))
dalby$time <- dalby$days
dalby$date <- ymd_hms(dalby$date)

# select section first
section <- 'frequentflushing'
method_name <- 'preset10_weeks_conf4'
method_call <- 'preset'

dat <- dalby[dalby$treatment == section, ]
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

error_fun <- function(dat, scheme, week_sets){
  
  # if we have random selection, two weeks per batch is chosen. 
  # one week in first and last half of each bath. The week is randomly picked:
  # that is for phase one it is picked between 1-6, and phase two 7-11.
  if(scheme == 'random'){
  sampled_weeks <- dat %>% 
    group_by(batch, phase) %>% 
    summarise(weeks = sample(unique(week_of_batch), 1)) %>% 
    arrange(batch, weeks)
  }
  
  # if we have predefined sample weeks. Four sets of three weeks are used. 
  # The week sets are distributed equally over the batch, but all contain different weeks. 
  # Each week set is randomly assigned to a batch so that any batch can get any week set.
  if(scheme == 'preset'){
    sampled_weeks <- week_sets
    unique_batches <- unique(sampled_weeks$batch)
    count_batches <- count(sampled_weeks, batch)
    random_order <- rep(sample(unique_batches), times = count_batches$n)
    sampled_weeks$batch <- random_order
  }
    
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

# if we want specific weeks to be sampled it has to be passed as argument
# 12 weeks/batch
#predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
#                            weeks = c(1, 5, 9, 4, 8, 12, 3, 7, 11, 2, 6, 10))
# 10 weeks/batch first config 
#predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 3, 3, 4, 4, 4), 
#                               weeks = c(1, 5, 9, 4, 8, 3, 7, 2, 6, 10))
# 10 weeks/batch second config 
#predefined_weeks <- data.frame(batch = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4), 
#                               weeks = c(5, 9, 4, 8, 3, 7, 11, 2, 6, 10))
# 11 weeks/batch first config
#predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4), 
#                               weeks = c(1, 5, 9, 4, 8, 3, 7, 11, 2, 6, 10))
# 10 weeks/batch third config
#predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 3, 3, 3, 4, 4), 
#                                weeks = c(1, 5, 9, 4, 8, 3, 7, 11, 2, 10))
# 10 weeks/batch fourth config
#predefined_weeks <- data.frame(batch = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4), 
#                               weeks = c(1, 9, 4, 8, 3, 7, 11, 2, 6, 10))
predefined_weeks <- data.frame(batch = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4), 
                               weeks = c(1, 9, 4, 8, 3, 7, 11, 2, 6, 10))


# simulate the four farms and get outputs in sim
sim <- NULL

for(i in 1:4){
  farm <- eval(parse(text = paste0('dat',i)))
  sim <- rbind(sim, error_fun(dat = farm, scheme = method_call, week_sets = predefined_weeks))
}

# bind sim and a simulation index
output1 <- cbind(sim, campaign)
output <- rbind(output, output1)

}

output <- as.data.frame(lapply(output, as.numeric))

stats_campaign <- output %>% group_by(campaign) %>% summarise(CH4_part = mean(meas_part_dat), 
                                              CH4_full = mean(meas_full_dat),
                                              error_mean = mean(abs(error)), 
                                              error_sd = sd(abs(error)), bias = mean(error))

stats_overall <- output %>% summarise(CH4_part = mean(meas_part_dat), 
                                             CH4_full = mean(meas_full_dat), 
                                             error_mean = mean(abs(error)), 
                                             error_sd = sd(abs(error)),
                                             bias = mean(error))

path_dat <- paste0(section,'_',method_name)

write.xlsx(output, paste0('../output/full_output_',path_dat,'.xlsx'))
write.xlsx(stats_campaign, paste0('../output/stats_campaign_',path_dat,'.xlsx'))
write.xlsx(stats_overall, paste0('../output/stats_overall_',path_dat,'.xlsx'))

output <- read_excel(paste0('../output/full_output_',path_dat,'.xlsx')) 
stats_campaign <- read_excel(paste0('../output/stats_campaign_',path_dat,'.xlsx'))
stats_overall <- read_excel(paste0('../output/stats_overall_',path_dat,'.xlsx'))

hist_full_output <- ggplot(output, aes(x = error)) +
  geom_histogram(binwidth = 1) + 
  theme_bw() + labs(x = "error, % from actual", y = "") + 
  theme(text = element_text(size = 14))

png(paste0('../plots/hist_all_', path_dat,'.png'), height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(hist_full_output)
dev.off()

hist_campaign <- ggplot(stats_campaign, aes(x = bias)) +
  geom_histogram(binwidth = 1) + 
  theme_bw() + labs(x = "mean error, % from actual", y = "") + 
  theme(text = element_text(size = 14))

png(paste0('../plots/hist_campaign_', path_dat,'.png'), height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(hist_campaign)
dev.off()

