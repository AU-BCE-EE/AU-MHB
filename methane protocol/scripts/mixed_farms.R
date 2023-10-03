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

method_call <- 'preset'

per <- read.csv('../dat/dalby_periods.csv')
per <- per[, -c(1)]
time_to_add <- hms("12:00:00")

dalby$batch <- NA

for (i in 1:4){
  
  # create intervals for each batch
  assign(paste0('int', i), ymd_hms(dmy(per[i, c('date.in', 'date.out')]) + time_to_add))
  assign(paste0('int', i), map2(eval(parse(text = paste0('int', i,'[1]'))),
                                eval(parse(text = paste0('int', i,'[2]'))),
                                interval))
  # assign batch
  dalby$batch[dalby$date %within% eval(parse(text = paste0('int', i)))] <- i
  
}

# add weeks and phases withing each batch
dalby <- dalby %>% mutate(weeks = days/7) %>% filter(!is.na(batch)) %>% group_by(batch) %>%
  mutate(week_of_batch = floor(weeks - weeks[1]) + 1) %>%
  mutate(midbatch = round(max(week_of_batch)/2)) %>% 
  mutate(phase = ceiling(week_of_batch/midbatch)) %>% ungroup()

dalby_C <- dalby[dalby$treatment == 'control',] %>% 
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, treatment)

dalby_WF <- dalby[dalby$treatment == 'frequentflushing',] %>% 
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, treatment)

metemis <- read.csv('../dat/metemis_2023.csv') 
metemis$date <- ymd_hms(metemis$date)
slurry_dat <- read.csv('../dat/metemis_slurry.csv') 

metemis_s5 <- full_join(metemis, slurry_dat) %>% arrange(datetime) %>% mutate(treatment = MPVPosition) %>% 
  select(datetime, CH4_emis, pigs, treatment) %>% mutate(date = as.Date(datetime)) %>%
  filter(treatment == 1) %>% mutate(treatment = 'section5') %>% select(-datetime)

per <- read.csv('../dat/metemis_periods_s5.csv')
per <- per[, -c(1)]
time_to_add <- hms("12:00:00")

metemis_s5$batch <- NA

for (i in 1:3){
  
  # create intervals for each batch
  assign(paste0('int', i), ymd_hms(dmy(per[i, c('date.in', 'date.out')]) + time_to_add))
  assign(paste0('int', i), map2(eval(parse(text = paste0('int', i,'[1]'))),
                                eval(parse(text = paste0('int', i,'[2]'))),
                                interval))
  # assign batch
  metemis_s5$batch[metemis_s5$date %within% eval(parse(text = paste0('int', i)))] <- i
  
}

metemis_s6 <- full_join(metemis, slurry_dat) %>% arrange(datetime) %>% mutate(treatment = MPVPosition) %>% 
  select(datetime, CH4_emis, pigs, treatment) %>% mutate(date = as.Date(datetime)) %>% 
  filter(treatment == 3) %>% mutate(treatment = 'section6') %>% select(-datetime)

per <- read.csv('../dat/metemis_periods_s6.csv')
per <- per[, -c(1)]
time_to_add <- hms("12:00:00")

metemis_s6$batch <- NA

for (i in 1:3){
  
  # create intervals for each batch
  assign(paste0('int', i), ymd_hms(dmy(per[i, c('date.in', 'date.out')]) + time_to_add))
  assign(paste0('int', i), map2(eval(parse(text = paste0('int', i,'[1]'))),
                                eval(parse(text = paste0('int', i,'[2]'))),
                                interval))
  # assign batch
  metemis_s6$batch[metemis_s6$date %within% eval(parse(text = paste0('int', i)))] <- i
  
}

metemis_s5m <- metemis_s5 %>% mutate(days = as.numeric(date - min(date))) %>% 
  mutate(weeks = days/7) %>% mutate(pigs = approx(days, pigs, days)$y) %>% 
  filter(!is.na(batch)) %>% group_by(batch) %>%
  mutate(week_of_batch = floor(weeks - weeks[1]) + 1) %>%
  mutate(midbatch = round(max(week_of_batch)/2)) %>% 
  mutate(phase = ceiling(week_of_batch/midbatch)) %>% ungroup() %>% mutate(CH4_rate = CH4_emis) %>% 
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, treatment)

metemis_s6m <- metemis_s6 %>% mutate(days = as.numeric(date - min(date))) %>% 
  mutate(weeks = days/7) %>% mutate(pigs = approx(days, pigs, days)$y) %>% 
  filter(!is.na(batch)) %>% group_by(batch) %>%
  mutate(week_of_batch = floor(weeks - weeks[1]) + 1) %>%
  mutate(midbatch = round(max(week_of_batch)/2)) %>% 
  mutate(phase = ceiling(week_of_batch/midbatch)) %>% ungroup() %>% mutate(CH4_rate = CH4_emis) %>% 
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, treatment)

#bind four farms. 
dat <- rbind(dalby_C, dalby_WF, metemis_s5m, metemis_s6m)

error_fun <- function(dat, scheme, week_sets, sim){
  
  # if we have random selection, two weeks per batch is chosen. 
  # one week in first and last half of each bath. The week is randomly picked:
  # that is for phase one it is picked between 1-6, and phase two 7-11.
  
  #if(scheme == 'random'){
  #  sampled_weeks <- dat %>% 
  #    group_by(batch, phase) %>% 
  #    summarise(weeks = sample(unique(week_of_batch), 1)) %>% 
  #    arrange(batch, weeks)
  #}
  
  # add random 4th batch to the metemis datasets.
  batch.rep.m5 <- sample(c(1:3), 1)
  batch.rep.m6 <- sample(c(1:3), 1)
  
  rep5 <- dat[dat$treatment == 'section5' & dat$batch == batch.rep.m5,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$treatment == 'section5']))
  rep6 <- dat[dat$treatment == 'section6' & dat$batch == batch.rep.m6,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$treatment == 'section6']))
  
  dat <- rbind(dat, rep5, rep6)
  
  # if we have predefined sample weeks. Four sets of three weeks are used. 
  # The week sets are distributed equally over the batch, but all contain different weeks. 
  # Each week set is randomly assigned to a batch so that any batch can get any week set.
  scheme <- 'preset'
  sampled_weeks <- data.frame()
  for (i in unique(dat$treatment)){
  if(scheme == 'preset'){
    sampled_weeks1 <- week_sets
    unique_batches <- unique(sampled_weeks1$batch)
    count_batches <- count(sampled_weeks1, batch)
    random_order <- rep(sample(unique_batches), times = count_batches$n)
    sampled_weeks1$batch <- random_order
    sampled_weeks1$treatment <- i
    sampled_weeks <- rbind(sampled_weeks, sampled_weeks1)
  }
  }
  
  #meas_part_dat <- dat %>% group_by(batch, week_of_batch) %>%
  #    summarise(CH4 = mean(CH4_rate/pigs, na.rm = T)) %>% group_by(batch) %>% 
  #    filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% 
  #    summarise(CH4 = mean(CH4, na.rm = T))
  
  
  meas_part_dat <- data.frame()
  meas_full_dat <- data.frame()
  error <- c()
  
  for (i in unique(dat$treatment)){
    
  meas_part_dat1 <- dat[dat$treatment == i,] %>% group_by(batch, week_of_batch) %>% filter(pigs != 0) %>%
    summarise(CH4 = mean(CH4_rate/pigs, na.rm = T)) %>% 
    group_by(batch) %>% 
    filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch & sampled_weeks$treatment == i]) %>% ungroup() %>%
    summarise(CH4 = mean(CH4, na.rm = T), week = mean(week_of_batch), treatment = i)
  
  meas_full_dat1 <- dat[dat$treatment == i,] %>% ungroup() %>% filter(pigs != 0) %>% summarise(CH4 = mean(CH4_rate/pigs, na.rm = T), treatment = i)

  error1 <- (meas_part_dat1$CH4/meas_full_dat1$CH4 - 1) * 100 
  
  meas_part_dat <- rbind(meas_part_dat, meas_part_dat1)
  meas_full_dat <- rbind(meas_full_dat, meas_full_dat1)
  error <- rbind(error, error1)
  
  }
  
  return(list(meas_part_dat = meas_part_dat$CH4, meas_full_dat = meas_full_dat$CH4, farm = meas_part_dat$treatment,
              error = error, sim = sim))
  
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
  #week_sets <- data.frame(batch = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4), 
  #                               weeks = c(1, 9, 4, 8, 3, 7, 11, 2, 6, 10))
  #week_sets <- data.frame(batch = c(1, 1, 2, 2, 3, 3, 4, 4), 
  #                               weeks = c(1, 9, 4, 8, 3, 7, 6, 10))
  week_sets <- data.frame(batch = c(1, 2, 2, 3, 3, 4), 
                          weeks = c(6, 4, 8, 3, 7, 10))
  #test week set1
  #predefined_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
  #                            weeks = c(2, 6, 10, 2, 6, 10, 2, 6, 10, 2, 6, 10))
  
  # simulate the four farms and get outputs in sim
  
  output <- rbind(output, data.frame(error_fun(dat = dat, scheme = method_call, week_sets = week_sets, sim = i)))
  
}

stat_farms <- output %>% group_by(farm) %>% summarise(mean_error = mean(error, na.rm = T), sd = sd(error, na.rm = T))
stat_campaigns <- output %>% group_by(sim) %>% summarise(error = mean(error, na.rm = T), sd = sd(error, na.rm = T))

error <-  as.numeric(output[,'error'])
uni.rows <- which(!duplicated(round(error, 4)))
hist(error[uni.rows], xlab = "error (%)", main = "", breaks = 10)

png('../plots/fig_hist_4farms.png', height = 3.5, width = 4, units = 'in', res = 600)
hist(error[uni.rows], xlab = "error (%)", main = "")
dev.off()

mean(error[uni.rows])
sd(error[uni.rows])

#uni.output <- output[uni.rows,]

#test <- error[uni.rows]

#write.csv(test, '../output/unirows_C.csv', row.names = F)
