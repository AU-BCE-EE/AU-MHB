# Merge inputs, sort out some variables

# Reference predictors
refdat <- subset(scenarios, scenario == 'ref')
refdat <- dfcombos(refdat, weather, etime, comp)
refdat$id <- paste('raw', 1:nrow(refdat))

# Liquid fraction inputs
lfdat <- subset(scenarios, scenario != 'ref')
lfdat <- dfcombos(lfdat, weather, etime, comp)
# Adjust DM and pH
lfdat$man.dm <- (1 - lfdat$red.dm) * lfdat$man.dm
lfdat$man.ph <- lfdat$man.ph + lfdat$dpH
lfdat$id <- paste('lf', 1:nrow(lfdat))

# Solid fraction inputs
sfdat <- subset(scenarios, scenario != 'ref')
sfdat <- dfcombos(sfdat, weather, etime, comp)
# Adjust DM and pH
sfdat$man.dm <- 15
# Add incorp
sfdat$incorp <- sfdat$incorp.sf
sfdat$t.incorp <- sfdat$t.incorp.sf
sfdat$id <- paste('sf', 1:nrow(sfdat))
