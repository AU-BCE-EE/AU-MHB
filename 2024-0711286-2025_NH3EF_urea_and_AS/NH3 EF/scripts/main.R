
rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('clean.R')
source('summ.R')
source('export.R')
source('plot.R')
render('stats.Rmd', output_file = '../stats/stats.pdf')
