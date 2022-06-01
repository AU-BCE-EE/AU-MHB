
# Stack to get field EFs for plots etc.
fdat <- rbindf(refdat, lfdat, sfdat)
fdat[is.na(fdat$incorp), 'incorp'] <- 'none'

fdat$EFp.field <- 100 * fdat$EF.field

# Summary stat calcs
fdatsumm <- aggregate2(fdat, x = 'EFp.field', 
                       by = c('app.timing', 'man.source', 'stype', 'scenario', 'app.mthd', 'incorp'),
                       FUN = list(p.mean = mean, mean = mean, min = min, max = max, sd = sd, n = length))

# Calculate parametric CI
fdatsumm$EFp.field.se = fdatsumm$EFp.field.sd / sqrt(fdatsumm$EFp.field.n)
fdatsumm$EFp.field.p.qs.5 <- fdatsumm$EFp.field.mean - qt(0.975, fdatsumm$EFp.field.n - 1) * fdatsumm$EFp.field.se
fdatsumm$EFp.field.p.qs.95 <- fdatsumm$EFp.field.mean + qt(0.975, fdatsumm$EFp.field.n - 1) * fdatsumm$EFp.field.se

# Get overall reduction in EF LF vs. RS
dd <- subset(fdatsumm, scenario %in% c('ref', 'sep') & stype != 'sf')
fdatsw <- dcast(dd, app.timing + man.source + app.mthd + incorp ~ stype, value.var = 'EFp.field.mean')
fdatsw$reff.sep <- 100 * (1 - fdatsw$lf / fdatsw$raw)
fecsumm <- aggregate2(fdatsw, 'reff.sep', 'app.mthd', list(n = length, mean = mean))
