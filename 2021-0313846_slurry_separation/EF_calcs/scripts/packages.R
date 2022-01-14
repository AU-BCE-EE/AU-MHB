# Load packages and create a version record

library(readxl)
library(ALFAM2)
library(ggplot2)
library(rmarkdown)
library(reshape2)

sink('../logs/versions.txt')
  print(sessionInfo())
sink()
