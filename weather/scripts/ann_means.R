# Calculate annual means just for 2010s

dmm2010s <- subset(dmm.all, decade == 2010)

# And overall means etc.
dasumm <- aggregate2(dmm.all, c('month', 'decade', 'temp', 'wv', 'wind.2m', 'rain.rate'), 
                    'decade', FUN = list(mean = mean, sd = sd, 
                                         min = min, max = max,
                                         p10 = function(x) quantile(x, 0.1),
                                         p90 = function(x) quantile(x, 0.9)))

dasumm <- rounddf(dasumm, 4, func = signif)
