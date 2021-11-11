

# Blanks
dat[dat == ''] <- NA

dat$date <- mdy(dat$date)

dat$year <- year(dat$date)
dat$decade <- paste0(substr(dat$year, 1, 3), '0')

# Subset
dat <- droplevels(dat[dat$source %in% c('Gylle, kvæg', 'Gylle, køer', 'Gylle, svin', 
                                        'Gylle afgasset', 'Gylle, kvæg Markforsuring',
                                        'Gylle, svin Markforsuring'), ])
dim(dat)

# Remove apparent duplicates (all without dates)
dat <- dat[!is.na(dat$date), ]

# Drop obs without needed variables
dat <- dat[!is.na(dat$DM + dat$TAN + dat$TN + dat$pH), ]
dim(dat)

# Look for other duplicates
dim(dat)
dat <- dat[!duplicated(dat[, c('source', 'DM', 'TN', 'TAN')]), ]
dim(dat)

# Drop obs with TAN > TN
dat <- dat[dat$TAN < dat$TN, ]
dim(dat)

# Drop obs with high DM
dat <- dat[dat$DM <= 10, ]
dim(dat)

# Check ranges
summary(dat)

# Reshape
dl <- melt(dat, id.vars = c('plannr', 'lbnr', 'source', 'date', 'decade'), measure.vars = c('DM', 'pH', 'TN', 'TAN'))

