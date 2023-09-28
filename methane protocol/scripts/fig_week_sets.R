rm(list = ls())

library(readxl)
library(dplyr)
library(ggplot2)
library(purrr)
library(lubridate)
library(openxlsx)


dat <- read_excel('../output/summary.xlsx')
dat$week.sets <- as.factor(gsub("\"", "", dat$week.sets))

fig_week_sets <- ggplot(dat, aes(x = week.sets, y = bias, fill = batch)) + 
  geom_bar(stat = 'identity', position = position_dodge()) + facet_grid(batch~section) + 
  labs(y = 'relative error (%)', x = 'week sets') + theme_bw()

png('../plots/fig_week_sets.png', height = 7, width = 6.5, units = 'in', res = 600)
    grid::grid.draw(fig_week_sets)
    dev.off()
