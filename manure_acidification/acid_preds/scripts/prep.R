# Get input data sorted out

wthr <- subset(wthr, month %in% c(4, 6) & decade == 2010)
wthr$air.temp <- wthr$temp.adj
wthr$wind.2m <- wthr$wind.2m.adj
wthr <- wthr[, c('month', 'decade', 'wind.2m', 'air.temp', 'rain.rate')]

dat <- titrat[rep(1:nrow(titrat), each = 2), ]
dat <- cbind(dat, wthr[rep(1:2, nrow(titrat)), c('month', 'wind.2m', 'air.temp')])

# Run ID
dat$rid <- 1:nrow(dat)

dat$man.ph <- dat$pH

# Add missing vars
dat$animal <- as.character(dat$animal)
##dm.dk <- c(Kvæg = 6.5, `Øko kvæg` = 6.5, Tyrekalve = 6.5,
##           Svin = 3.9, `So-/smågrise` = 3.9, Slagtesvin = 3.9,
##           Afgasset = 5.1, `Afgasset biogas` = 5.1)
pig <- c(Kvæg = FALSE, `Øko kvæg` = FALSE, Tyrekalve = FALSE,
        Svin = TRUE, `So-/smågrise` = TRUE, Slagtesvin = TRUE,
        Afgasset = FALSE, `Afgasset biogas` = FALSE)


# Add DM from titration samples
# Drop extra Horsens sample
dim(dm)
dm <- dm[!duplicated(dm[, c('sample', 'animal')]), ]
dim(dm)
# all.x applies to dat, so dropped digestate samples should still be dropped
##dat <- merge(dat, dm, by = c('sample', 'animal'), all.x = TRUE)
# Missing DM samples now dropped
dat <- merge(dat, dm, by = c('sample', 'animal'))
### Fill in missing DM with DK means
##dat$man.dm[is.na(dat$man.dm)] <- dm.dk[dat$animal][is.na(dat$man.dm)]

table(dat$animal.sample, is.na(dat$man.dm))

# Other vars
dat$man.source.pig <- pig[dat$animal]
dat$ct <- 168
dat$app.rate.ni <- 30
dat$rain.rate <- 0.09 # From 750 mm/yr for Jutland from Tavs
dat$rain.cum <- dat$rain.rate * dat$ct / 2 # Use midpoint

# Arbitrary TAN application rate - does not matter
dat$tan.app <- 3 * dat$app.rate.ni

#### NTS NTS !!!!!!!
#### Adjust DM for sens
###dat$man.dm <- 1.5 * dat$man.dm
