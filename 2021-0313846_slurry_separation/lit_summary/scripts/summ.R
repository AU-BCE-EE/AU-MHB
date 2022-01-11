# Summarize data

# Long data frame for use below
dl <- melt(dat, id.vars = c('source', 'sep.scale', 'slurry.source', 'S.exp.ID', 'A.exp.ID', 'set', 'fraction'), 
           measure.vars = c('S.DM', 'A.DM', 'DM', 'TAN.sep.eff', 'S.emis.perc', 'A.emis.perc'), na.rm = TRUE)

# DM summary ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DM summary first by study (source) and experiment or treatment etc.
dmds1 <- aggregate(dat[, c('DM'), drop = FALSE], 
                 by = dat[, c('source', 'sep.scale', 'slurry.source', 'set', 'fraction')], FUN = mean, na.rm = TRUE)
# Spread out fractions across columns
dmdw1 <- dcast(dmds1, source + sep.scale + slurry.source + set ~ fraction, value.var = 'DM')
names(dmdw1)[5:8] <- paste0('DM.', names(dmdw1)[5:8])

# Change in DM due to separation
dmdw1$dDM.liquid <- dmdw1$DM.liquid - dmdw1$DM.raw
dmdw1$dDM.solid <- dmdw1$DM.solid - dmdw1$DM.raw
dmdw1$rdDM.liquid <- 100 * dmdw1$dDM.liquid / dmdw1$DM.raw
dmdw1$rdDM.solid <- 100 * dmdw1$dDM.solid / dmdw1$DM.raw

# Final summary
dmds2 <- aggregate(dmdw1[, c('DM.raw', 'DM.liquid', 'DM.solid', 'dDM.liquid', 'dDM.solid', 'rdDM.liquid', 'rdDM.solid')], 
                 by = dmdw1[, c('sep.scale', 'slurry.source')], FUN = mean, na.rm = TRUE)
names(dmds2)[-1:-2] <- paste0(names(dmds2)[-1:-2], '.mean')
dmsds2 <- aggregate(dmdw1[, c('DM.raw', 'DM.liquid', 'DM.solid', 'dDM.liquid', 'dDM.solid', 'rdDM.liquid', 'rdDM.solid')], 
                 by = dmdw1[, c('sep.scale', 'slurry.source')], FUN = sd, na.rm = TRUE)
names(dmsds2)[-1:-2] <- paste0(names(dmsds2)[-1:-2], '.sd')
dmns2 <- aggregate(dmdw1[, c('DM.raw', 'DM.liquid', 'DM.solid', 'dDM.liquid', 'dDM.solid', 'rdDM.liquid', 'rdDM.solid')], 
                 by = dmdw1[, c('sep.scale', 'slurry.source')], FUN = function(x) sum(!is.na(x)))
names(dmns2)[-1:-2] <- paste0(names(dmns2)[-1:-2], '.n')
dmds2 <- merge(dmds2, dmsds2, by = c('sep.scale', 'slurry.source'))
dmds2 <- merge(dmds2, dmns2, by = c('sep.scale', 'slurry.source'))
dmds2 <- dmds2[order(dmds2$sep.scale, dmds2$slurry.source), ]

# DM table for report ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
dmtab <- dmds2[dmds2$sep.scale == 'full' & dmds2$slurry.source %in% c('cattle', 'pig', 'digestate'), 
             c('slurry.source', 'DM.raw.mean', 'DM.liquid.mean', 'DM.solid.mean', 'rdDM.liquid.mean', 'rdDM.liquid.sd', 'rdDM.liquid.n')]
dmtab <- rounddf(dmtab, 1)

# pH summary ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# pH summary first by study (source) and experiment or treatment etc.
phds1 <- aggregate(dat[, c('pH'), drop = FALSE], 
                 by = dat[, c('source', 'sep.scale', 'slurry.source', 'set', 'fraction')], FUN = mean, na.rm = TRUE)
# Spread out fractions across columns
phdw1 <- dcast(phds1, source + sep.scale + slurry.source + set ~ fraction, value.var = 'pH')
names(phdw1)[5:8] <- paste0('pH.', names(phdw1)[5:8])

# Change in pH due to separation
phdw1$dpH.liquid <- phdw1$pH.liquid - phdw1$pH.raw
phdw1$dpH.solid <- phdw1$pH.solid - phdw1$pH.raw

# Final summary
phds2 <- aggregate(phdw1[, c('pH.raw', 'pH.liquid', 'pH.solid', 'dpH.liquid', 'dpH.solid', 'dpH.liquid', 'dpH.solid')], 
                 by = phdw1[, c('sep.scale', 'slurry.source')], FUN = mean, na.rm = TRUE)
names(phds2)[-1:-2] <- paste0(names(phds2)[-1:-2], '.mean')
phsds2 <- aggregate(phdw1[, c('pH.raw', 'pH.liquid', 'pH.solid', 'dpH.liquid', 'dpH.solid', 'dpH.liquid', 'dpH.solid')], 
                 by = phdw1[, c('sep.scale', 'slurry.source')], FUN = sd, na.rm = TRUE)
names(phsds2)[-1:-2] <- paste0(names(phsds2)[-1:-2], '.sd')
phns2 <- aggregate(phdw1[, c('pH.raw', 'pH.liquid', 'pH.solid', 'dpH.liquid', 'dpH.solid', 'dpH.liquid', 'dpH.solid')], 
                 by = phdw1[, c('sep.scale', 'slurry.source')], FUN = function(x) sum(!is.na(x)))
names(phns2)[-1:-2] <- paste0(names(phns2)[-1:-2], '.n')
phds2 <- merge(phds2, phsds2, by = c('sep.scale', 'slurry.source'))
phds2 <- merge(phds2, phns2, by = c('sep.scale', 'slurry.source'))
phds2 <- phds2[order(phds2$sep.scale, phds2$slurry.source), ]

# pH table for report ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
phtab <- phds2[phds2$sep.scale == 'full' & phds2$slurry.source %in% c('cattle', 'pig', 'digestate'), 
             c('slurry.source', 'pH.raw.mean', 'pH.liquid.mean', 'pH.solid.mean', 'dpH.liquid.mean', 'dpH.liquid.sd', 'dpH.liquid.n')]
phtab <- rounddf(phtab, 3, func = signif)

# Other variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# First by study (source) and experiment or treatment etc.
##ds1 <- aggregate(dl[, c('value'), drop = FALSE], 
##                 by = dl[, c('source', 'sep.scale', 'slurry.source', 'set', 'fraction', 'variable')], FUN = mean, na.rm = TRUE)

ds1 <- aggregate(dat[, c('DM', 'S.DM', 'DM.sep.eff', 'TAN.sep.eff', 'S.emis.perc', 'S.emis.ini')], 
                 by = dat[, c('source', 'sep.scale', 'slurry.source', 'set', 'fraction')], FUN = mean, na.rm = TRUE)

# Final summary
ds2 <- aggregate(ds1[, c('DM', 'S.DM', 'DM.sep.eff', 'TAN.sep.eff', 'S.emis.perc', 'S.emis.ini')], 
                 by = ds1[, c('sep.scale', 'slurry.source', 'fraction')], FUN = mean, na.rm = TRUE)
names(ds2)[-1:-3] <- paste0(names(ds2)[-1:-3], '.mean')
sds2 <- aggregate(ds1[, c('DM', 'S.DM', 'DM.sep.eff', 'TAN.sep.eff', 'S.emis.perc', 'S.emis.ini')], 
                 by = ds1[, c('sep.scale', 'slurry.source', 'fraction')], FUN = sd, na.rm = TRUE)
names(sds2)[-1:-3] <- paste0(names(sds2)[-1:-3], '.sd')
ns2 <- aggregate(ds1[, c('DM', 'S.DM', 'DM.sep.eff', 'TAN.sep.eff', 'S.emis.perc', 'S.emis.ini')], 
                 by = ds1[, c('sep.scale', 'slurry.source', 'fraction')], FUN = function(x) sum(!is.na(x)))
names(ns2)[-1:-3] <- paste0(names(ns2)[-1:-3], '.n')
ds2 <- merge(ds2, sds2, by = c('sep.scale', 'slurry.source', 'fraction'))
ds2 <- merge(ds2, ns2, by = c('sep.scale', 'slurry.source', 'fraction'))
ds2 <- ds2[order(ds2$sep.scale, ds2$slurry.source, ds2$fraction), ]

# Sep eff table for report ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
setab <- ds2[ds2$sep.scale == 'full' & ds2$slurry.source %in% c('cattle', 'pig', 'digestate') & ds2$fraction == 'liquid', 
             c('slurry.source', 'TAN.sep.eff.mean', 'TAN.sep.eff.sd', 'TAN.sep.eff.n')]
setab <- rounddf(setab, 1)


