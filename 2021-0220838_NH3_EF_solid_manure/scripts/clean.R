# Clean data . . .

# Remove space and s at end of name to create consistent method groups
dat$meas.meth[grepl('^micrometeorological', dat$meas.meth)] <- 'micromet'

# Calculation TAN as frac of total N
dat$fTAN <- dat$TAN / dat$totN

## Add (DK) seasons based on average temperature when available
#dat$season.temp <- as.character(cut(dat$temp.avg, c(-Inf, 3.1, 14, Inf), labels = c('winter', 'spring/autumn', 'summer')))
## Replace season is it wasn't provided
#dat$season[is.na(dat$season)] <- dat$season.temp[is.na(dat$season)]
dat$season[is.na(dat$season)] <- 'unknown'

# Avoid capitalization problems
dat$manure.source <- tolower(dat$manure.source)
dat$incorp.depth <- tolower(dat$incorp.depth)
dat$meas.meth <- tolower(dat$meas.meth)
dat$season <- tolower(dat$season)

# Add names for plots
dat$manure.source.nm <- oneupper(dat$manure.source)
dat$incorp.depth.nm <- oneupper(dat$incorp.depth)
dat$meas.meth.nm <- oneupper(gsub('^micromet', 'micrometeorological', dat$meas.meth))
dat$season.nm <- factor(oneupper(dat$season), levels = c('Spring', 'Summer', 'Autumn', 'Winter', 'Unknown'))

# Get integer code for source, sorted so micromet results are at top
dat <- dat[order(-dat$abs.emis.info, dat$incorp == 'yes', dat$manure.source == 'poultry'), ]
dat$source.key <- as.factor(as.integer(factor(dat$source, levels = unique(dat$source))))
source.keys <- unique(dat[, c('source', 'source.key')])

# Norm data
normdat$manure.source.nm <- oneupper(normdat$manure.source)
normdat$fTAN <- normdat$TAN / normdat$totN
