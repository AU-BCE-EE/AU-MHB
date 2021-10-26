# Add wind at 2 m
dat$wind.2m <- dat$wv * log(2/0.01) / log(10/0.01)

# Trailing "00" on some station numbers
dat$station <- gsub('00$', '', dat$station)
# And "01" on 611601
dat$station <- gsub('01$', '', dat$station)

# Reshape
dl <- melt(dat, id.vars = c('station', 'date'))

# Add date info
dl$eday <- as.numeric(dl$date - ymd('1979 12 31'))
dl$doy <- yday(dl$date)
dl$year <- year(dl$date)
#dl$month <- sprintf('%02d', month(dl$date))
dl$month <- month(dl$date)
dl$decade <- gsub('[0-9]$', '0', dl$year)

dl <- mutate(group_by(dl, station, variable),
             interp = is.na(value),
             value = approx(eday, value, eday)$y
             )


