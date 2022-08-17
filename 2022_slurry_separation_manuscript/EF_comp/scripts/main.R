# Summarize lit data, compare to ALFAM2 predictions
# Also produces plot showing lit data on RS vs LF EF

rm(list = ls())

source('functions.R')
source('packages.R')
source('load.R')
source('combine.R')
source('factors.R')
render('stats.Rmd', output_dir = '../reports')
source('plot.R')

