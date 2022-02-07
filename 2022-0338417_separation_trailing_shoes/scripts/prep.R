# Merge inputs, sort out some variables

# Create all combos
dat <- dfcombos(type, app, weather, pH, DM)

# Create ID
dat$id <- 1:nrow(dat)

# Add ct
dat$ct <- 168

# And TAN app (dummy)
dat$tan.app <- 100

