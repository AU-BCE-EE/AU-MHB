# Merge inputs, sort out some variables

# Create all combos
dat <- expand.grid(man.source = type$man.source, 
                   app.mthd = app$app.mthd, 
                   app.timing = weather$app.timing,
                   man.ph = pH$man.ph,
                   man.dm = DM$man.dm)

# Merge in additional columns
dat <- merge(dat, weather, by = 'app.timing')
dat <- merge(dat, app, by = 'app.mthd')

# Create ID
dat$id <- 1:nrow(dat)

# Add ct
dat$ct <- 168

# And TAN app (dummy)
dat$tan.app <- 100

