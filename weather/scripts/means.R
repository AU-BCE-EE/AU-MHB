
# Means by month x decade, without calculate by station first
# Idea is that this approach minimizes the bias from incomplete datasets
dmm <- aggregate(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')], 
                 dat[, c('month', 'decade')], FUN = mean, na.rm = TRUE)


dmm <- dmm[order(dmm$decade, dmm$month), ]

# Number of obs (by station)
dns <- aggregate(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')], 
                 dat[, c('station', 'month', 'decade', 'year')], FUN = function(x) sum(!is.na(x))) 

# Fraction missing
fna <- aggregate(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')], 
                 dat[, c('month', 'decade')], FUN = function(x) mean(is.na(x)))

# Table summary to check which stations are included
dd <- dat[!is.na(rowSums(dat[, c('temp', 'wv', 'wind.2m', 'rain.rate')])), ]
dno <- table(dd$station, dd$year)

# Get means separately by season
seas <- data.frame(month = 3:9, season = c('Marts', 'April', 'Maj', 'Sommer', 'Sommer', 'Sommer', 'Efterår'))
seas$season <- factor(seas$season, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
dmm <- merge(dmm, seas, by = 'month')

dmm$wind.2m.adj <- 1.15 * dmm$wind.2m
dmm$temp.adj <- dmm$temp + 0.9

dmms <- aggregate(dmm[, c('temp', 'wv', 'wind.2m', 'temp.adj', 'wind.2m.adj', 'rain.rate')], 
                 dmm[, c('season', 'decade')], FUN = mean, na.rm = TRUE)

