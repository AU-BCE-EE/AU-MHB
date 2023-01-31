# Calculate overall means

summ10 <- aggregate(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')], 
                    dat[, c('station', 'month', 'decade')], FUN = mean, na.rm = TRUE)

summ11 <- aggregate(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')], 
                    dat[, c('station', 'decade')], FUN = mean, na.rm = TRUE)

dasumm <- aggregate2(summ11, c('temp', 'wv', 'wind.2m', 'rain.rate'), 
                    c('decade'), FUN = list(mean = mean, min = min, max = max, n = n), na.rm = TRUE)

dasumm <- rounddf(dasumm, 4, func = signif)
