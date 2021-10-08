# Calculation of emission factors

rm(list = ls())

source('packages.R')
source('load.R')
source('prep.R')
render('predict.Rmd', output_dir = '../logs')
source('reshape.R')
source('interp.R')
source('export.R')

