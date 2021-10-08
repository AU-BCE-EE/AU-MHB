# Merge inputs, sort out some variables

nw <- nrow(weather)
na <- nrow(app)
nc <- nrow(comp)
dat <- cbind(weather[rep(1:nw, na), ], app[rep(1:na, each = nw), ])
dat <- cbind(dat[rep(1:(nw * na), nc), ], comp[rep(1:nc, each = nw * na), ])

# Add application method info
dat$man.source.pig <- ifelse(dat$man.source == 'pig', TRUE, FALSE)

# Add fixed time
dat$ct <- 168
dat$tan.app <- 100
dat$id <- 1:nrow(dat)

# Digestate only data frame with variable pH
dig <- subset(comp, man.source == 'digestate')
pH <- seq(5, dig$man.ph, length.out = 50)
dig <- data.frame(man.source = dig$man.source, man.dm = dig$man.dm, man.ph = pH)
nd <- nrow(dig)

# Add other inputs
digdat <- cbind(weather[rep(1:nw, na), ], app[rep(1:na, each = nw), ])
digdat <- cbind(digdat[rep(1:(nw * na), nd), ], dig[rep(1:nd, each = nw * na), ])

digdat$ct <- 168
digdat$tan.app <- 100
digdat$id <- 1:nrow(digdat)

# Add reference conditions for test of ALFAM2 calculations
ref <- data.frame(ct = 168, t.incorp = NA,
                  tan.app = 100,
                  app.mthd.os = 0, app.rate.ni = 40, man.dm = 6, man.source.pig = 0,
                  app.mthd.cs = 0, app.mthd.bc = 0, app.mthd.ts = 0,
                  air.temp = 13, wind.2m = 2.7, 
                  ts.cereal.hght = 0, 
                  man.ph = 7.5, rain.rate = 0)


## Add detailed key and sort
#dat$id1 <- dat$id
