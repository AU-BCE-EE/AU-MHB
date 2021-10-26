# Uses ALFAM2 model to calculate emission and emission reductions for all pH values interpolated titration curves
# Ultimately returns acid dose needed for 25% reduction and more

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('drop.R')
source('pars.R')
source('prep.R')
source('run_mod.R')
source('summ.R')
source('pH_interp.R')
source('export.R')
source('plot.R')
