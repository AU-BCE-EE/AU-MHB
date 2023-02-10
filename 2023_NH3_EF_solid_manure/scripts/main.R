# Main script for data analysis

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('clean.R')
source('incorp.R')
source('EF.R')
source('paper_summ.R')
render('summary.Rmd', output_dir = '../output')
source('counts.R')
source('export.R')
source('plot.R')

