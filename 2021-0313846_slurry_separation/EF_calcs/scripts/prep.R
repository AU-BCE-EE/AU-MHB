# Merge inputs, sort out some variables

nw <- nrow(weather)
nd <- nrow(dat)
dat <- cbind(weather[rep(1:nw, nd), ], dat[rep(1:nd, each = nw), ])

# Add fixed time
dat$ct <- 168
dat$tan.app <- 100
dat$id <- 1:nrow(dat)
