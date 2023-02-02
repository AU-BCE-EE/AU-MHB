# Calculate monthly means

summ20 <- aggregate(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')], 
                    dat[, c('station', 'month', 'decade')], FUN = mean, na.rm = TRUE)

# Get mean, min, max among 7 stations
dmsumm <- aggregate2(summ20, c('temp', 'wv', 'wind.2m', 'rain.rate'), 
                    c('month', 'decade'), FUN = list(mean = mean, min = min, max = max, n = n), na.rm = TRUE)

dmsumm <- rounddf(dmsumm, 4, func = signif)
