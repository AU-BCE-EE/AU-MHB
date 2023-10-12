rm(list = ls())

dat <- read.csv('../output/stat_farms.csv') %>% filter(subdat == 1)

ggplot(dat, aes(weeksets, y = mean_error)) + geom_bar(stat = 'identity') + 
  geom_errorbar(aes(ymin = mean_error - sd, ymax = mean_error + sd), width = 0.2) +
facet_wrap(subdat~farm) + theme_bw() +
   theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs(y = 'error, %', x = "")
