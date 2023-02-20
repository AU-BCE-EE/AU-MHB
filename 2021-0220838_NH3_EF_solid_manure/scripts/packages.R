# Load packages

library('ggplot2')
library('rmarkdown')
library('openxlsx')
library('data.table')
library('knitr')
library('gridExtra')

sink('../logs/R-versions.txt')
  print(sessionInfo())
sink()
