# Calculation of emission factors

rm(list = ls())

source('packages.R')
source('load.R')
source('functions.R')
source('prep.R')
render('predict.Rmd', output_dir = '../logs')
source('factors.R')
source('reshape.R')
source('export.R')
source('plot.R')
