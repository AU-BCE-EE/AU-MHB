
ff <- list.files('../data', full.names = TRUE)

# Read and stack
dat <- data.frame()
for (i in ff) {
  d <- read.csv(i, as.is = TRUE, na.strings = 'null')
  if(grepl('[0-9][0-9]\\/[0-9][0-9]\\/[0-9][0-9][0-9][0-9]', d$date[1])) {
    d$date <- dmy(d$date)
  } else if (grepl('[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]', d$date[1])) {
    d$date <- ymd(d$date)
  } else {
    stop('Date problem. . .')
  }
  dat <- rbind(dat, d)
}
