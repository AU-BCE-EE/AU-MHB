import <- function(){

dalby <- read.csv('../dat/dalby_2023.csv') %>% filter(!treatment %in% c("slurryfunnels","slurrytrays"))
dalby$time <- dalby$days
dalby$date <- ymd_hms(dalby$date)

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

dalby_C <- dalby[dalby$treatment == 'control',] %>% mutate(section = treatment) %>%
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, section)

dalby_WF <- dalby[dalby$treatment == 'frequentflushing',] %>% mutate(section = treatment) %>%
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, section)

metemis <- read.csv('../dat/metemis_2023.csv') 
metemis$date <- ymd_hms(metemis$date)
slurry_dat <- read.csv('../dat/metemis_slurry.csv') 

metemis_s5 <- full_join(metemis, slurry_dat) %>% arrange(datetime) %>% mutate(section = MPVPosition) %>% 
  select(datetime, CH4_emis, pigs, section) %>% mutate(date = as.Date(datetime)) %>%
  filter(section == 1) %>% mutate(section = 'section5') %>% select(-datetime)

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

metemis_s6 <- full_join(metemis, slurry_dat) %>% arrange(datetime) %>% mutate(section = MPVPosition) %>% 
  select(datetime, CH4_emis, pigs, section) %>% mutate(date = as.Date(datetime)) %>% 
  filter(section == 3) %>% mutate(section = 'section6') %>% select(-datetime)

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
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, section)

metemis_s6m <- metemis_s6 %>% mutate(days = as.numeric(date - min(date))) %>% 
  mutate(weeks = days/7) %>% mutate(pigs = approx(days, pigs, days)$y) %>% 
  filter(!is.na(batch)) %>% group_by(batch) %>%
  mutate(week_of_batch = floor(weeks - weeks[1]) + 1) %>%
  mutate(midbatch = round(max(week_of_batch)/2)) %>% 
  mutate(phase = ceiling(week_of_batch/midbatch)) %>% ungroup() %>% mutate(CH4_rate = CH4_emis) %>% 
  select(CH4_rate, days, weeks, week_of_batch, midbatch, batch, pigs, section)

#bind four farms. 
  dat <- rbind(dalby_C, dalby_WF, metemis_s5m, metemis_s6m)

  return(dat)
  
}