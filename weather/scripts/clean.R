
# Two different date formats argh!
dat$df <- ifelse(grepl('^[0-9][0-9][0-9][0-9]', dat$date), 'ymd', 'dmy')

dat$date2 <- date(NA)
dat$date2[dat$df == 'ymd'] <- ymd(dat$date[dat$df == 'ymd'])
dat$date2[dat$df == 'dmy'] <- dmy(dat$date[dat$df == 'dmy'])

dat$year <- year(dat$date2)
dat$month <- month(dat$date2)
dat$decade <- 10 * dat$year %/% 10

# Day of year

dat$doy <- as.integer(as.character(dat$date2, format = '%j'))

# Precipitation rate
dat$rain.rate <- dat$prec / 24

# Older data (< 2014) have prec08 (precipitation at 8.00)
dat$rain.rate[is.na(dat$prec)] <- dat$prec08[is.na(dat$prec)]  / 24

# Add wind at 2 m
dat$wind.2m <- dat$wv * log(2/0.01) / log(10/0.01)

# Exclude what must be a data entry error on rainfall (see plots)
dat.all <- dat
dat$rain.rate[dat$rain.rate > 15] <- NA

# Calculate global radiation in W/m2 (originally MJ/m2, presumably total over the day)
dat$rad <- dat$glorad * 1E6 / 86400

# Fix station IDs (some have extra digits)
dat$station <- substr(dat$station, 1, 4)
