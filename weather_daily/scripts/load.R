
ff <- list.files('../data', full.names = TRUE)

dat <- data.frame()
for (i in ff) {
  dat <- rbindf(dat, read.csv(i, na.strings = 'null'))
}
