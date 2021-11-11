# Shows fit of set 2 calibration

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('clean.R')
source('subsets.R')
render('predict.Rmd', output_dir = '../logs')
source('eval_subs.R')
#source('fit_summ.R')
#render('explore.Rmd', output_dir = '../logs')
source('plots.R')
