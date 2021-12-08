# Sort out model inputs

dat$man.source <- dat$slurry
dat$id <- 1:nrow(dat)
dat$app.mthd <- dat$app.meth
dat$app.mthd <- gsub('s$', '', dat$app.mthd)
# Surface applied is most similar to broadcast, according to JMP
dat$app.mthd <- gsub('surface applied', 'broadcast', dat$app.mthd)

# Set wind speed
dat$wind.2m <- 0.05
dat$wind.2m[grepl('^DTM', dat$meas.meth)] <- 2.7

# Separate
datraw <- datsep <- dat
datraw$man.dm <- datraw$DM.un
datsep$man.dm <- datsep$DM.sep
datraw$man.ph <- datraw$ph.un
datsep$man.ph <- datsep$ph.sep
datraw$tan.app <- datraw$TAN.un * datraw$app.amount.un
datsep$tan.app <- datsep$TAN.sep * datsep$app.amount.sep
