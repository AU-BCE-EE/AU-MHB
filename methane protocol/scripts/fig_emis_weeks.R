
meas_full_dat <- dat %>% mutate(round_days = ceiling(days)) %>% group_by(round_days) %>% 
  summarise(CH4 = mean(CH4_rate, na.rm = T), pigs = mean(pigs, na.rm = T), batch = mean(batch, na.rm = T), 
            week_of_batch = mean(week_of_batch, na.rm =T), date = mean(date, na.rm = T)) %>%
  group_by(batch, week_of_batch)

sampled_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
                            weeks = c(1,5,9,1,5,9,1,5,9,1,5,9))

meas_part_dat1 <- dat %>% mutate(round_days = ceiling(days)) %>% group_by(round_days) %>% 
  summarise(CH4 = mean(CH4_rate, na.rm = T), pigs = mean(pigs, na.rm = T), batch = mean(batch, na.rm = T), 
            week_of_batch = mean(week_of_batch, na.rm =T), date = mean(date, na.rm = T)) %>%
  group_by(batch, week_of_batch) %>%
  filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% 
  mutate(week_set = 1)

sampled_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
                            weeks = c(2,6,10,2,6,10,2,6,10,2,6,10))

meas_part_dat2 <- dat %>% mutate(round_days = ceiling(days)) %>% group_by(round_days) %>% 
  summarise(CH4 = mean(CH4_rate, na.rm = T), pigs = mean(pigs, na.rm = T), batch = mean(batch, na.rm = T), 
            week_of_batch = mean(week_of_batch, na.rm =T), date = mean(date, na.rm = T)) %>%
  group_by(batch, week_of_batch) %>%
  filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% 
  mutate(week_set = 2)

sampled_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
                            weeks = c(3,7,11,3,7,11,3,7,11,3,7,11))

meas_part_dat3 <- dat %>% mutate(round_days = ceiling(days)) %>% group_by(round_days) %>% 
  summarise(CH4 = mean(CH4_rate, na.rm = T), pigs = mean(pigs, na.rm = T), batch = mean(batch, na.rm = T), 
            week_of_batch = mean(week_of_batch, na.rm =T), date = mean(date, na.rm = T)) %>%
  group_by(batch, week_of_batch) %>%
  filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% 
  mutate(week_set = 3)

sampled_weeks <- data.frame(batch = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), 
                            weeks = c(4,8,12,4,8,12,4,8,12,4,8,12))

meas_part_dat4 <- dat %>% mutate(round_days = ceiling(days)) %>% group_by(round_days) %>% 
  summarise(CH4 = mean(CH4_rate, na.rm = T), pigs = mean(pigs, na.rm = T), batch = mean(batch, na.rm = T), 
            week_of_batch = mean(week_of_batch, na.rm =T), date = mean(date, na.rm = T)) %>%
  group_by(batch, week_of_batch) %>%
  filter(week_of_batch %in% sampled_weeks$weeks[sampled_weeks$batch == batch]) %>% 
  mutate(week_set = 4)

meas_part_dat <- bind_rows(meas_part_dat1, meas_part_dat2, meas_part_dat3, meas_part_dat4)
meas_part_dat$week_set <- as.factor(meas_part_dat$week_set)

fig_emis_weeks <- ggplot(meas_part_dat, aes(x = date, y = CH4/pigs, col = week_set)) + 
  geom_point() + 
  labs(y = expression('CH'[4]~',g day'^{-1}~'pig'^{-1}), x = "", col = 'week set') + 
  theme_bw() + theme(text = element_text(size = 14))

png('../plots/fig_emis_weeks.png', height = 7, width = 6.5, units = 'in', res = 600)
grid::grid.draw(fig_emis_weeks)
dev.off()

  

