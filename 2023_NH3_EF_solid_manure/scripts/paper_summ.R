# Get paper names with micromet and cattle or pig manure

p1 <- unique(subset(dat, manure.source %in% c('cattle', 'pig') & meas.meth == 'micromet')$source)

