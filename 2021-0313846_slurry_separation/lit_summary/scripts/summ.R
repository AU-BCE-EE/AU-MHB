# Summarize data

# Long data frame for use below
dl <- melt(dat, id.vars = c('source', 'sep.scale', 'slurry.source', 'S.exp.ID', 'A.exp.ID', 'exp.ID', 'fraction'), 
           measure.vars = c('S.DM', 'A.DM', 'DM', 'TAN.sep.eff', 'S.emis.perc', 'A.emis.perc'), na.rm = TRUE)

# DM summary ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DM summary first by study (source) and experiment or treatment etc.
dmds1 <- aggregate(dat[, c('DM'), drop = FALSE], 
                 by = dat[, c('source', 'sep.scale', 'slurry.source', 'exp.ID', 'fraction')], FUN = mean, na.rm = TRUE)
# Spread out fractions across columns
dmdw1 <- dcast(dmds1, source + sep.scale + slurry.source + exp.ID ~ fraction, value.var = 'DM')
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

# Other variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# First by study (source) and experiment or treatment etc.
##ds1 <- aggregate(dl[, c('value'), drop = FALSE], 
##                 by = dl[, c('source', 'sep.scale', 'slurry.source', 'exp.ID', 'fraction', 'variable')], FUN = mean, na.rm = TRUE)

ds1 <- aggregate(dat[, c('DM', 'S.DM', 'DM.sep.eff', 'TAN.sep.eff', 'S.emis.perc', 'S.emis.ini')], 
                 by = dat[, c('source', 'sep.scale', 'slurry.source', 'exp.ID', 'fraction')], FUN = mean, na.rm = TRUE)

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

