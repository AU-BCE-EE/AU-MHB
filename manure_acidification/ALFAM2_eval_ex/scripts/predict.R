# Predict emission with ALFAM2 model

datl$wind.2m <- datl$wind
datl$air.temp <- datl$temp
datl$man.ph <- datl$pH
datl$man.dm <- datl$DM / 10
datl$app.rate <- datl$man.app
datl$app.mthd.bc <- datl$app.mthd == 'Broadcast'

d <- subset(datl, !is.na(wind.2m + air.temp + man.ph + man.dm + app.rate))
pred <- ALFAM2mod(d, pars = parf, time.name = 'dur', app.name = 'tan.app', group = 'tid')

d$e.pred1 <- 100 * pred$er

# Get wide predicted values
dw <- dcast(d, cid ~ acond, value.var = 'e.pred1')
names(dw)[2:3] <- paste0('e.', names(dw)[2:3], '.pred1')
dat <- merge(dat, dw, by = 'cid', all.x = TRUE)
dat$r.pred1 <- 1 - dat$e.a.pred1/dat$e.u.pred1

