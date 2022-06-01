# Merge inputs, sort out some variables

sep <- sep[, c('source', 'slurry.source', 'rdDM.lf', 'dpH.lf', 'TAN.sep.eff.sf')]
sep$slurry.source <- capwords(sep$slurry.source)
# Create unique ID for each separation observation from literature
sep$id.sep <- 1:nrow(sep)

# Fill in missing dpH.lf values
# NTS: Need to report counts of filled/estimate variables
sep$dpH.lf[is.na(sep$dpH.lf)] <- median(sep$dpH.lf, na.rm = TRUE)
sep$rdDM.lf[is.na(sep$rdDM.lf)] <- median(sep$rdDM.lf, na.rm = TRUE)
sep$TAN.sep.eff.sf[is.na(sep$TAN.sep.eff.sf)] <- median(sep$TAN.sep.eff.sf, na.rm = TRUE)

# Merge in separation data with fixed slurry composition
sep.comp <- merge(comp, sep, by.x = 'man.source', by.y = 'slurry.source', all = TRUE)

# Reference predictors
# Note that the large number of separation observations are *not* included for ref/raw because they have no effect on field or overall EFs
refdat <- subset(scenarios, scenario == 'ref')
refdat <- dfcombos(refdat, weather, etime, comp)
refdat$app.mthd <- refdat$app.mthd.rl
refdat$id <- paste('raw', 1:nrow(refdat))
refdat$stype <- 'raw'

# Separation inputs
sdat <- subset(scenarios, scenario != 'ref')
sdat <- dfcombos(sdat, weather, etime, sep.comp)
# Create ID to use to merge lf and sf later for overall calculation
sdat$id <- paste('sep', 1:nrow(sdat))

# Liquid fraction inputs
lfdat <- sdat
lfdat$app.mthd <- lfdat$app.mthd.rl
lfdat$TAN.sep.eff.sf <- NULL
# Adjust DM and pH
lfdat$man.dm <- (1 + lfdat$rdDM.lf / 100) * lfdat$man.dm
lfdat$man.ph <- lfdat$man.ph + lfdat$dpH.lf
lfdat$stype <- 'lf'

# Solid fraction inputs
# Presently separation observations have no effect on field EFs, but later TAN.sep.eff does affect overall calcs
# Leaving in here 1) in case we add SF pH change and 2) it is simpler than changing code
# Also note that there are duplicate conditions here because of app.mthd.rl, which does not apply here
# But keeping this data frame big makes merging later easier (id values match)
sfdat <- sdat
# Adjust DM and pH
sfdat$man.dm <- 15
# Remove any application rate effect
sfdat$app.rate.ni <- 0
# App method
sfdat$app.mthd <- sfdat$app.mthd.sf
# Add incorp
sfdat$incorp <- sfdat$incorp.sf
sfdat$t.incorp <- sfdat$t.incorp.sf
sfdat$stype <- 'sf'
