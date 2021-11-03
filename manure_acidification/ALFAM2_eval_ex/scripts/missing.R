# Fill in missing values (there are many)

dat[is.na(dat$temp), 'temp'] <- 13
dat[is.na(dat$wind), 'wind'] <- 2.7
dat[is.na(dat$DM.a), 'DM.a'] <- dat[is.na(dat$DM.a), 'DM.u']
dat[is.na(dat$DM.u), 'DM.u'] <- dat[is.na(dat$DM.u), 'DM.a']
dat[is.na(dat$DM.a), 'DM.a'] <- 60
dat[is.na(dat$DM.u), 'DM.u'] <- 60
