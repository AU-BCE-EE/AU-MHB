# Merge inputs, sort out some variables

nw <- nrow(weather)
na <- nrow(app)
nc <- nrow(comp)
dat <- cbind(weather[rep(1:nw, na), ], app[rep(1:na, each = nw), ])
dat <- cbind(dat[rep(1:(nw * na), nc), ], comp[rep(1:nc, each = nw * na), ])

# Drop acidification for all but trailing hose
dat <- dat[dat$app.mthd == 'Trailing hose' | dat$acid == '0 kg/t', ]
rownames(dat) <- 1:nrow(dat)

# Add fixed time
dat$ct <- 168
dat$tan.app <- 100
dat$id <- 1:nrow(dat)

# Add reference conditions for test of ALFAM2 calculations
ref <- data.frame(ct = 168, t.incorp = NA,
                  tan.app = 100,
                  app.mthd.os = 0, app.rate.ni = 40, man.dm = 6, man.source.pig = 0,
                  app.mthd.cs = 0, app.mthd.bc = 0, app.mthd.ts = 0,
                  air.temp = 13, wind.2m = 2.7, 
                  ts.cereal.hght = 0, 
                  man.ph = 7.5, rain.rate = 0)
