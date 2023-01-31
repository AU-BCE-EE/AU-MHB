# Means of STM input by day of year

# First site x doy
dms <- aggregate2(dat, c('temp', 'wind.2m', 'rain.rate', 'rad'),
                  by = c('station', 'doy'), FUN = list(mean = mean, n = n),
                  na.rm = TRUE)

dss <- aggregate2(dms, c('temp.mean', 'rad.mean', 'wind.2m.mean'),
                   by = 'station', FUN = list(mean = mean))

# Coldest and hottest stations
statcold <- dss[order(dss$temp.mean.mean), 'station'][1]
stathot <- dss[order(-dss$temp.mean.mean), 'station'][1]

dsc <- dms[dms$station == statcold, ]
dsh <- dms[dms$station == stathot, ]
dsm <- aggregate(dms[, c('temp.mean', 'wind.2m.mean', 'rain.rate.mean', 'rad.mean')],
                      dms[, 'doy', drop = FALSE], FUN = mean)

# Select columns for STM
cc <- c('doy', 'temp.mean', 'rad.mean') 
dscs <- rounddf(dsc[, cc], 4, func = signif)
dshs <- rounddf(dsh[, cc], 4, func = signif) 
dsms <- rounddf(dsm[, cc], 4, func = signif) 
