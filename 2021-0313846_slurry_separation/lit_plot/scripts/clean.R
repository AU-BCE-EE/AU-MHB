
dat <- dat[, c('source', 'A.meas.meth', 'sep.meth', 'slurry.source', 'A.app.meth', 'fractionA', 'set', 'A.DM', 'A.pH', 'A.TAN', 'A.emis.perc')]
dat <- dat[! is.na(dat$A.emis.perc), ]
dat <- dat[dat$A.app.meth == 'trailing hose' | dat$A.app.meth == 'broadcast', ]

dat1 <- dat[dat$fractionA == 'raw', ]
dat1 <- dat1[, c(1:2, 4:5, 7:11)]
colnames(dat1) <- c('source', 'A.meas.meth', 'slurry.source', 'app.method', 'set', 'DM.raw', 'pH.raw', 'TAN.raw', 'emis.perc.raw')
dat2 <- dat[dat$fractionA == 'liquid', ]
dat2 <- dat2[, c(1:5, 7:11)]
colnames(dat2) <- c('source', 'A.meas.meth', 'sep.meth', 'slurry.source', 'app.method', 'set', 'DM.liq', 'pH.liq', 'TAN.liq', 'emis.perc.liq')

dat3 <- left_join(dat2, dat1, by = c('source', 'A.meas.meth', 'app.method', 'slurry.source', 'set'))

dat <- dat3

dat.raw <- dat[, c('source', 'A.meas.meth', 'sep.meth', 'slurry.source', 'app.method', 'DM.raw', 'TAN.raw', 'pH.raw', 'emis.perc.raw')]
dat.raw$sep <- 'No'
dat.raw$number <- as.numeric(c(1:nrow(dat.raw)))

dat.liq <- dat[, c('source', 'A.meas.meth', 'sep.meth', 'slurry.source', 'app.method', 'DM.liq', 'TAN.liq', 'pH.liq', 'emis.perc.liq')]
dat.liq$sep <- 'Yes'
dat.liq$number <- as.numeric(c(1:nrow(dat.liq)))

colnames(dat.raw) <- c('source', 'meas.meth', 'sep.meth', 'Slurry', 'app.meth', 'DM', 'TAN', 'pH', 'emis', 'Separated', 'number')
colnames(dat.liq) <- c('source', 'meas.meth', 'sep.meth', 'Slurry', 'app.meth', 'DM', 'TAN', 'pH', 'emis', 'Separated', 'number')

datA <- rbind(dat.raw, dat.liq)

datA$Separated1 <- datA$Separated
datA$Separated1 <- mapvalues(datA$Separated1, from = c('No'), to = c('Ubehandlet'))
datA$Separated1 <- mapvalues(datA$Separated1, from = c('Yes'), to = c('Separeret'))

datA$Slurry1 <- datA$Slurry
datA$Slurry1 <- mapvalues(datA$Slurry1, from = c('cattle'), to = c('Kvæggylle'))
datA$Slurry1 <- mapvalues(datA$Slurry1, from = c('pig'), to = c('Svinegylle'))
datA$Slurry1 <- mapvalues(datA$Slurry1, from = c('digested pig'), to = c('Afgasset biomasse'))
datA$Slurry1 <- mapvalues(datA$Slurry1, from = c('digestate'), to = c('Afgasset biomasse'))




