rm(list = ls())

library(readxl)
library(dplyr)
library(ggplot2)
library(purrr)
library(lubridate)
library(openxlsx)
library("pracma")


dat <- read_excel('../dat/Measurement during flushing_13.05.2021.xlsx') %>% 
  mutate(days = as.numeric(date_time - min(date_time))/60/60/24) %>% 
  filter(round(MPVPosition) == MPVPosition) %>% mutate(valve = as.factor(MPVPosition)) %>% 
  mutate(CH4 = CH4 - mean(CH4[valve == 5], na.rm = T)) %>% group_by(valve) %>%
  mutate(CH4_cum = cumtrapz(days, CH4)) %>% filter(valve != 5)

ggplot(dat, aes(x = date_time, y = CH4, col = valve)) + geom_line()

start_flush_freq <- 0.30660179
end_flush_freq <- 0.31545677
plot(dat$days[dat$days > start_flush_freq & dat$days <end_flush_freq], dat$CH4[dat$days > start_flush_freq & dat$days <end_flush_freq])

start_flush_control <- 0.352
end_flush_control <- 0.362
plot(dat$days[dat$days > start_flush_control & dat$days <end_flush_control], dat$CH4[dat$days > start_flush_control & dat$days <end_flush_control])

slurry_mass_control <- 7843.512
slurry_mass_freq <- 2485.6200

ggplot(dat, aes(x = date_time, y = CH4_cum, col = valve)) + geom_line() + theme(text = element_text(size = 16))

stat_freq_flush <- dat %>% filter(days > start_flush_freq & days < end_flush_freq) %>% summarise(cum_freq = max(cumtrapz(days, CH4)), time = max(days) - min(days))
stat_freq_before <- dat %>% filter(days < start_flush_freq, valve == 1) %>% summarise(cum_freq = max(cumtrapz(days, CH4)), time = max(days) - min(days))
stat_control_flush <- dat %>% filter(days > start_flush_control & days < end_flush_control) %>% summarise(cum_freq = max(cumtrapz(days, CH4)), time = max(days) - min(days))
stat_control_before <- dat %>% filter(days < start_flush_control, valve == 3) %>% summarise(cum_freq = max(cumtrapz(days, CH4)), time = max(days) - min(days))

stat_control_flush
stat_control_before
stat_freq_flush
stat_freq_before

stat_control_flush$cum_freq/slurry_mass_control
stat_freq_flush$cum_freq/slurry_mass_freq


