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
method_name <- 'preset'
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
  mutate(phase = ceiling(week_of_batch/midbatch)) %>% ungroup() %>% 
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs)

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
  
  #meas_part_dat <- dat %>% group_by(batch, week_of_batch) %>%
  #    summarise(CH4 = mean(CH4_rate/pigs, na.rm = T)) %>% group_by(batch) %>% 
  #    filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% 
  #    summarise(CH4 = mean(CH4, na.rm = T))
  
  meas_part_dat <- dat %>% group_by(batch, week_of_batch) %>%
    summarise(CH4 = mean(CH4_rate/pigs, na.rm = T)) %>% 
    group_by(batch) %>% 
    filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% ungroup() %>%
    summarise(CH4 = mean(CH4, na.rm = T), week = mean(week_of_batch))
  
  #meas_full_dat <- dat %>% group_by(batch) %>% summarise(CH4 = mean(CH4_rate/pigs, na.rm = T))
  meas_full_dat <- dat %>% ungroup() %>% summarise(CH4 = mean(CH4_rate/pigs, na.rm = T))
  
  error <- (meas_part_dat$CH4/meas_full_dat$CH4 - 1) * 100 
  
  return(list(meas_part_dat = meas_part_dat$CH4, meas_full_dat = meas_full_dat$CH4,
              error = error, mean_week = meas_part_dat$week, sampled_weeks = sampled_weeks))
  
}

# repeat simulation 

n_sim <- 100
output <- NULL

for(i in 1:n_sim){

#predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
#                            weeks = c(2, 6, 10, 3, 7, 11, 1, 5, 9, 4, 8, 12))
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
#10 weeks/batch fourth config
predefined_weeks <- data.frame(batch = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4), 
                               weeks = c(1, 9, 4, 8, 3, 7, 11, 2, 6, 10))


#test week set1
#predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
#                            weeks = c(2, 6, 10, 2, 6, 10, 2, 6, 10, 2, 6, 10))

# simulate the four farms and get outputs in sim

output <- rbind(output, error_fun(dat = dat, scheme = method_call, week_sets = predefined_weeks))

}

output <- as.list(output)

error <-  as.numeric(output[,'error'])
uni.rows <- which(!duplicated(round(error,4)))

hist(error[uni.rows], xlab = "error (%)", main = "")

#png('../plots/fig_hist_frequent.png', height = 3.5, width = 4, units = 'in', res = 600)
#hist(error[uni.rows], xlab = "error (%)", main = "")
#dev.off()

mean(error[uni.rows])
sd(error[uni.rows])

uni.output <- output[uni.rows,]

test <- error[uni.rows]

write.csv(test, '../output/unirows_C.csv', row.names = F)
