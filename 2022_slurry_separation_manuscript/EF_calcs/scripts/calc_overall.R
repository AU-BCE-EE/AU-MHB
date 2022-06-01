
# Raw slurry reference
refdat$EF.field.raw <- refdat$EF.field
refdat$EF.field <- NULL
refdat <- merge(refdat, stor, by = 'man.source')
refdat$EF.overall <- refdat$EF.stor.raw +  (1 - refdat$EF.stor.raw) * refdat$EF.field.raw
refdat$stor.frac.EF <- 100 * refdat$EF.stor.raw / refdat$EF.overall

# Separated scenarios
# Combine based on ID column created in prep.R
sepdat <- merge(lfdat[, c('id', 'man.dm', 'man.ph', 'EF.field')], sfdat, by = c('id'), suffixes = c('.lf', '.sf'), all = TRUE)
sepdat <- merge(sepdat, stor, by = 'man.source', all = TRUE)
sepdat$EF.overall <- (1 - sepdat$TAN.sep.eff.sf/100) * (sepdat$EF.stor.lf + (1 - sepdat$EF.stor.lf) * sepdat$EF.field.lf) +
                              sepdat$TAN.sep.eff.sf/100 * (sepdat$EF.stor.sf + (1 - sepdat$N.loss.stor.sf) * sepdat$EF.field.sf)
sepdat$stor.frac.EF <- 100 * ((1 - sepdat$TAN.sep.eff.sf/100) * sepdat$EF.stor.lf + sepdat$TAN.sep.eff.sf/100 * sepdat$EF.stor.sf)/ sepdat$EF.overall

                           
# Combine ref and sep (stack)
datl <- rbindf(refdat, sepdat)
datl$EFp.overall <- 100 * datl$EF.overall

## Spread by scenario for error bar plot
#dats <- dcast(datl, app.timing + man.source + app.mthd + incorp.sf ~ scenario, value.var = 'EFp.overall')

# Summary stat calcs, including CI by bootstap
datlsumm <- aggregate2(datl, x = c('EFp.overall', 'stor.frac.EF'), 
                       by = c('app.timing', 'man.source', 'scenario', 'app.mthd.rl', 'app.mthd.sf', 'incorp.sf'),
                       FUN = list(p.mean = mean, mean = mean, min = min, max = max, sd = sd, n = length, b = boot))

# Extract boot results (put them in their own columns)
datlsumm$EFp.overall.b.mean <- datlsumm$EFp.overall.b[, 1]
datlsumm$EFp.overall.b.se <- datlsumm$EFp.overall.b[, 2]
datlsumm$EFp.overall.b.qs.5 <- datlsumm$EFp.overall.b[, 3]
datlsumm$EFp.overall.b.qs.95 <- datlsumm$EFp.overall.b[, 4]

# Calculate parametric CI
datlsumm$EFp.overall.se = datlsumm$EFp.overall.sd / sqrt(datlsumm$EFp.overall.n)
datlsumm$EFp.overall.p.qs.5 <- datlsumm$EFp.overall.mean - qt(0.975, datlsumm$EFp.overall.n - 1) * datlsumm$EFp.overall.se
datlsumm$EFp.overall.p.qs.95 <- datlsumm$EFp.overall.mean + qt(0.975, datlsumm$EFp.overall.n - 1) * datlsumm$EFp.overall.se

## Note that counts in sepdat, e.g., see next lines, are the same as results in pred.Rmd
#table(refdat$man.source, refdat$scenario, refdat$app.mthd.rl, refdat$app.timing)
#table(sepdat$man.source, sepdat$scenario, sepdat$app.mthd.rl, sepdat$app.timing)
