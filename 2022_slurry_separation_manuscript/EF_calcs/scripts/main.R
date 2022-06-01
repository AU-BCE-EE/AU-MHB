# Calculation of overall (storage + field application) emission factors

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('prep.R')
knit('predict.Rmd', output = '../logs/predict.md')
source('field_summ.R')
source('calc_overall.R')
source('factors.R')
source('export.R')
source('plot.R')
