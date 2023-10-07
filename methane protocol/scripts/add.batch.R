add.batch <- function(dat){
  
  # the fourth batch could be batch 1, 2 or 3
  rep51 <- dat[dat$section == 'section5' & dat$batch == 1, ] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$section == 'section5']))
  rep51_full <- bind_rows(dat[dat$section == 'section5',], rep51) %>% mutate(subdat = 1)
  
  rep61 <- dat[dat$section == 'section6' & dat$batch == 1,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$section == 'section6']))
  rep61_full <- bind_rows(dat[dat$section == 'section6',], rep61) %>% mutate(subdat = 1)
  
  rep52 <- dat[dat$section == 'section5' & dat$batch == 2,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$section == 'section5'])) 
  rep52_full <- bind_rows(dat[dat$section == 'section5',], rep52) %>% mutate(subdat = 2)
  
  rep62 <- dat[dat$section == 'section6' & dat$batch == 2,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$section == 'section6']))
  rep62_full <- bind_rows(dat[dat$section == 'section6',], rep62) %>% mutate(subdat = 2)
  
  rep53 <- dat[dat$section == 'section5' & dat$batch == 3,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$section == 'section5'])) 
  rep53_full <- bind_rows(dat[dat$section == 'section5',], rep53) %>% mutate(subdat = 3)
  
  rep63 <- dat[dat$section == 'section6' & dat$batch == 3,] %>% 
    mutate(batch = 4, days = days - min(days) + 1) %>% mutate(days = days + max(dat$days[dat$section == 'section6']))
  rep63_full <- bind_rows(dat[dat$section == 'section5',], rep63) %>% mutate(subdat = 3)
  
  dat$subdat <- 1
  
  # rebind data with the extra batch in metemis datasets.
  dat <- dat[dat$section %in% c('control', 'frequentflushing'), ]
  dat <- rbind(dat, rep51_full, rep61_full, rep52_full, rep62_full, rep53_full, rep63_full)
  
  return(dat)
  
}