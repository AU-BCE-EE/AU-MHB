# Calculation of emission factors

rm(list = ls())

source('packages.R')
source('load.R')
source('prep.R')
render('predict.Rmd', output_dir = '../logs')
source('calc_overall.R')
source('factors.R')
source('export.R')
source('plot.R')
