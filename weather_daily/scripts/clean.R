
# Two different date formats argh!
dat$df <- ifelse(grepl('^[0-9][0-9][0-9][0-9]', dat$date), 'ymd', 'dmy')

dat$date2 <- date(NA)
dat$date2[dat$df == 'ymd'] <- ymd(dat$date[dat$df == 'ymd'])
dat$date2[dat$df == 'dmy'] <- dmy(dat$date[dat$df == 'dmy'])

dat$year <- year(dat$date2)
dat$month <- month(dat$date2)
dat$decade <- 10 * dat$year %/% 10

## Precipitation rate
#dat$rain.rate <- dat$prec / 24
#
## Older data (< 2014) seems to use different name for prec08
#dat$rain.rate[is.na(dat$prec)] <- dat$prec08[is.na(dat$prec)]  / 24

dat$rain.rate <- NA

# Add wind at 2 m
dat$wind.2m <- dat$wv * log(2/0.01) / log(10/0.01)

