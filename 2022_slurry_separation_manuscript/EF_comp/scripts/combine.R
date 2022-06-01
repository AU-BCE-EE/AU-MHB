# Stack literature data and ALFAM2 output

# Just compare trailing hose from ALFAM2
a2dat <- subset(a2dat, stype %in% c('raw', 'lf') & app.mthd == 'Trailing hose')
a2dat$EF.type <- 'ALFAM2'

# Exclude incorporation from literature data
dat <- subset(dat, app.meth %in% c('band spread on slots', 'broadcast', 'trailing hose') & frac.studA != 'sf')
dat$EFp.field <- dat$emis.perc
dat$man.source <- capwords(dat$slurry.source)
dat$man.dm <- dat$DM
dat$EF.type <- 'Measured'

cdat <- rbindf(dat, a2dat)


