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

# overview
ggplot(dalby, aes(days, CH4_rate)) + facet_grid(~treatment) + geom_line()
summarise(group_by(dalby, treatment), CH4 = mean(CH4_rate/pigs, na.rm = T))

# select control first
dat <- dalby[dalby$treatment == 'control',]

# number of measuring periods in one year
output <- data.frame()

for(meas_length in c(1:14)){

# length of each measurement period in days
meas_periods <- 10

error_fun <- function(dat, meas_periods, meas_length){

# sampling of measurement days
dates_sampled <- sample(dat$date, meas_periods)
start <- dates_sampled - ddays(meas_length/2)
end <- dates_sampled + ddays(meas_length/2)
meas_ints <- map2(start, end, interval)
condition <- expression(date %within% meas_ints)

# measured emission, part versus full data
meas_part_dat <- summarise(dat, CH4 = mean(CH4_rate[eval(condition)]/pigs[eval(condition)], na.rm = T))
meas_full_dat <- summarise(dat, CH4 = mean(CH4_rate/pigs, na.rm = T))

# error in %
error <- (meas_part_dat/meas_full_dat - 1) * 100 

return(list(error = error, meas_length = meas_length, meas_periods = meas_periods))

}

error_fun(dat, meas_periods, meas_length)$meas_length
# call function x times
rep <- 1000 # how many times should we call it
error <- do.call(rbind, replicate(rep, error_fun(dat, meas_periods, meas_length)$error))
error_mean <- mean(abs(error))
error_sd <- sd(abs(error)) 
meas_length <- error_fun(dat, meas_periods, meas_length)$meas_length
meas_periods <- error_fun(dat, meas_periods, meas_length)$meas_periods

# bind outputs
output1 <- cbind(error_mean, error_sd, meas_length, meas_periods)
output <- rbind(output, output1)

}

write.csv(output, '../output/rand_n_length.csv', row.names = F)

rand_n_periods <- ggplot(output, aes(meas_periods, error_mean)) + geom_bar(stat = 'identity') +
  geom_errorbar(aes(ymin = error_mean - error_sd, ymax = error_mean + error_sd)) +
  labs(y = 'mean error (%)', x = "Measuring periods pr. year") + 
  theme(text = element_text(size = 14)) + theme_bw() + 
  annotate("text", x = 7, y = 40, label = "Note: Each measuring period is 7 days", size = 4)

png('../plots/rand_n_periods.png', height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(rand_n_periods)
dev.off()

rand_n_length <- ggplot(output, aes(meas_length, error_mean)) + geom_bar(stat = 'identity') +
  geom_errorbar(aes(ymin = error_mean - error_sd, ymax = error_mean + error_sd)) +
  labs(y = 'mean error (%)', x = "Measuring length pr. meas period") + 
  theme(text = element_text(size = 14)) + theme_bw() + 
  annotate("text", x = 7, y = 40, label = "Note: 10 measuring periods pr year", size = 4)

png('../plots/rand_n_length.png', height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(rand_n_length)
dev.off()

# none random sampling: 

output <- data.frame()

batch_intervals <- 


for(meas_length in c(1:14)){
  
  # length of each measurement period in days
  meas_periods <- 10
  
  error_fun <- function(dat, meas_periods, meas_length){
    
    # sampling of measurement days
    dates_sampled <- sample(dat$date, meas_periods)
    start <- dates_sampled - ddays(meas_length/2)
    end <- dates_sampled + ddays(meas_length/2)
    meas_ints <- map2(start, end, interval)
    condition <- expression(date %within% meas_ints)
    
    # measured emission, part versus full data
    meas_part_dat <- summarise(dat, CH4 = mean(CH4_rate[eval(condition)]/pigs[eval(condition)], na.rm = T))
    meas_full_dat <- summarise(dat, CH4 = mean(CH4_rate/pigs, na.rm = T))
    
    # error in %
    error <- (meas_part_dat/meas_full_dat - 1) * 100 
    
    return(list(error = error, meas_length = meas_length, meas_periods = meas_periods))
    
  }
  
  error_fun(dat, meas_periods, meas_length)$meas_length
  # call function x times
  rep <- 1000 # how many times should we call it
  error <- do.call(rbind, replicate(rep, error_fun(dat, meas_periods, meas_length)$error))
  error_mean <- mean(abs(error))
  error_sd <- sd(abs(error)) 
  meas_length <- error_fun(dat, meas_periods, meas_length)$meas_length
  meas_periods <- error_fun(dat, meas_periods, meas_length)$meas_periods
  
  # bind outputs
  output1 <- cbind(error_mean, error_sd, meas_length, meas_periods)
  output <- rbind(output, output1)
  
}