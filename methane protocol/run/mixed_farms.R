rm(list = ls())

library(readxl)
library(dplyr)
library(ggplot2)
library(purrr)
library(lubridate)
library(openxlsx)
library(gtools)


# import and process data
source('../scripts/import.R')
source('../scripts/add.batch.R')

dat <- import()

# function for handling 
error_fun <- function(dat, scheme){
  
  # add 4th batch to the metemis datasets (which only contains 3 batches).
  dat <- add.batch(dat)

  # Even though the sets of weeks within a batch are predefined, we need to assign the 
  # batch sets to the four batches. This can be done in 24 possible combinations (4!)
  sequence <- c(1, 2, 3, 4)
  perms <- combinat::permn(sequence)
  
  sampled_weeks <- data.frame()
  
  for (i in unique(dat$section)){
      
      sampled_weeks1 <- scheme
      count_batches <- count(sampled_weeks1, batch)
      batch <- do.call(c, lapply(perms, function(x) rep(x, times = count_batches$n)))
      sampled_weeks1<- cbind(sampled_weeks1[, c('batchset','weeks')], batch)
      sampled_weeks1$section <- i
      sampled_weeks1$batch_arrangement <- rep(1:length(perms), each = nrow(scheme)) 
      sampled_weeks <- rbind(sampled_weeks, sampled_weeks1)
      
    }
  

  meas_part_dat <- data.frame()
  meas_full_dat <- data.frame()

  for (i in unique(dat$section)){
    
    meas_part_dat2 <- data.frame()
    meas_full_dat2 <- data.frame()
    
    for (o in unique(sampled_weeks$batch_arrangement)){
    
      meas_part_dat1 <- dat[dat$section == i,] %>% group_by(subdat, batch, week_of_batch) %>% filter(pigs != 0) %>%
                        summarise(CH4 = mean(CH4_rate/pigs, na.rm = T)) %>% 
                        group_by(batch, subdat) %>% 
                        filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch & sampled_weeks$section == i & sampled_weeks$batch_arrangement == o]) %>% group_by(subdat) %>%
                        summarise(CH4 = mean(CH4, na.rm = T), section = i, batch_arrangement = o, weeks = paste(scheme$weeks, collapse = ","))

      meas_full_dat1 <- dat[dat$section == i,] %>% group_by(subdat) %>% filter(pigs != 0) %>% summarise(CH4 = mean(CH4_rate/pigs, na.rm = T), section = i)
      
      # bind data from different batch arrangements
      meas_part_dat2 <- rbind(meas_part_dat2, meas_part_dat1)
      meas_full_dat2 <- rbind(meas_full_dat2, meas_full_dat1)
    
    }
    
    # bind data from different sections
    meas_part_dat <- rbind(meas_part_dat, meas_part_dat2)
    meas_full_dat <- rbind(meas_full_dat, meas_full_dat2)
  
  }
  
  return(list(meas_part_dat = meas_part_dat$CH4, meas_full_dat = meas_full_dat$CH4, 
              batch_arrangement = meas_part_dat$batch_arrangement, farm = meas_part_dat$section, 
              subdat = meas_part_dat$subdat, weeksets = meas_part_dat$weeks))
  
}

# load spreadsheet containing the handpicked measuring schemes
schemes <- read_excel('../dat/schemes.xlsx')

output <- data.frame()

# loop though error_fun() for each measuring scheme
for (i in unique(schemes$scheme)){
  
  output1 <- as.data.frame(error_fun(dat = dat, scheme = schemes[schemes$scheme == i, ]))
  output <- rbind(output, output1)
  
}

#add % error
output$error <- (output$meas_part_dat/output$meas_full_dat - 1) * 100
stat_farms <- output %>% group_by(farm, subdat, weeksets) %>% summarise(mean_error = mean(error, na.rm = T), sd = sd(error, na.rm = T), 
                                                                mean_estimate = mean(meas_part_dat), sd_estimate = sd(meas_part_dat), 
                                                                min_estimate = min(meas_part_dat), max_estimate = max(meas_part_dat), 
                                                                true_emis = mean(meas_full_dat))

write.csv(stat_farms, '../output/stat_farms.csv', row.names = F)
write.csv(output, '../output/full_output.csv', row.names = F)
