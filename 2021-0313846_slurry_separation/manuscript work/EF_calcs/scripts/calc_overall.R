
# Raw slurry reference
refdat <- merge(refdat, stor, by = 'man.source')
refdat$EF.overall <- refdat$EF.stor.raw +  (1 - refdat$EF.stor.raw) * refdat$EF.field.raw

# Separated scenarios
sepdat <- merge(lfdat, sfdat, by = c('app.timing', 'man.source', 'scenario', 'app.mthd', 'app.mthd.sf', 'incorp.sf'),
                suffixes = c('.liquid', '.solid'))
sepdat <- merge(sepdat, stor, by = 'man.source')
sepdat <- merge(sepdat, sep, by = 'scenario')
sepdat$EF.overall <- (1 - sepdat$sep.eff.TAN) * (sepdat$EF.stor.liquid + (1 - sepdat$EF.stor.liquid) * sepdat$EF.field.liquid) +
                              sepdat$sep.eff.TAN * (sepdat$EF.stor.solid + (1 - sepdat$N.loss.stor.solid) * sepdat$EF.field.solid)

                            
# Combine ref and sep 
datl <- rbindf(refdat, sepdat)
datl$EFp.overall <- 100 * datl$EF.overall

## Spread by scenario for error bar plot
#dats <- dcast(datl, app.timing + man.source + app.mthd + incorp.sf ~ scenario, value.var = 'EFp.overall')
