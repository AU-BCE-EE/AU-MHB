# Interpolate pH and dpH to common levels only for plots for storage question

# Set pH levels
pH.levels <- 40:90/10

pHidat <- data.frame()

dat$id <- interaction(dat$animal, dat$sample, dat$season)
dat <- droplevels(dat)

for (x in split(dat, dat$id)) {
  ddll <- pH.levels[pH.levels <= max(x$pH, na.rm = TRUE) & pH.levels >= min(x$pH, na.rm = TRUE)]
  x <- x[!duplicated(x$pH), ]
  y1 <- spline(x$pH, x$e.rel, xout = ddll, method = 'hyman')$y
  y2 <- spline(x$pH, x$red, xout = ddll, method = 'hyman')$y
  dd <- data.frame(animal = x$animal[1], sample = x$sample[1], season = x$season[1], id = x$id[1], pH = ddll, e.rel = y1, red = y2)
  dd <- na.omit(dd)
  pHidat <- rbind(pHidat, dd)
}

# Summarize by animal and pH level
pH.summ <- as.data.frame(summarise(group_by(pHidat, animal, season, pH),
                                n = length(unique(sample)),
                                e.rel.m = mean(e.rel), e.rel.s = sd(e.rel), e.rel.mn = min(e.rel), e.rel.mx = max(e.rel),
                                red.m = mean(red), red.s = sd(red), red.mn = min(red), red.mx = max(red)))


# Check normal sample n by animal type and drop parts of curve with lower n (to avoid jumps)
pH.summ <- as.data.frame(mutate(group_by(pH.summ, animal), n.samps = max(n)))
pH.summ <- subset(pH.summ, n == n.samps)

# Repeat by with dpH not pH
dpH.levels <- 0:50/10

dpHidat <- data.frame()

for (x in split(dat, dat$id)) {
  ddll <- dpH.levels[dpH.levels <= max(x$dpH, na.rm = TRUE) & dpH.levels >= min(x$dpH, na.rm = TRUE)]
  x <- x[!duplicated(x$dpH), ]
  y1 <- spline(x$dpH, x$e.rel, xout = ddll, method = 'hyman')$y
  y2 <- spline(x$dpH, x$red, xout = ddll, method = 'hyman')$y
  dd <- data.frame(animal = x$animal[1], sample = x$sample[1], season = x$season[1], id = x$id[1], dpH = ddll, e.rel = y1, red = y2)
  dd <- na.omit(dd)
  dpHidat <- rbind(dpHidat, dd)
}

# Summarize by animal and dpH
dpH.summ <- as.data.frame(summarise(group_by(dpHidat, animal, season, dpH),
                                n = length(unique(sample)),
                                e.rel.m = mean(e.rel), e.rel.s = sd(e.rel), e.rel.mn = min(e.rel), e.rel.mx = max(e.rel),
                                red.m = mean(red), red.s = sd(red), red.mn = min(red), red.mx = max(red)))


# Check normal sample n by animal type and drop parts of curve with lower n (to avoid jumps)
dpH.summ <- as.data.frame(mutate(group_by(dpH.summ, animal), n.samps = max(n)))
dpH.summ <- subset(dpH.summ, n == n.samps)

