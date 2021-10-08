# Dose required for pH 6.6 and 6.0

# First get single dose that will give an average pH of 6 or 6.6
# Call this method 1
# Drop obs without *all* samples
atdat <- as.data.frame(mutate(group_by(atdat, animal), n.max = max(n)))
pHint1 <- subset(atdat, n == n.max)

# Interpolate to pH 6 and 6.6
pHi1 <- data.frame()
for (x in split(pHint1, pHint1$animal)) {
  pl <- c(6.0, 6.6)
  y1 <- spline(x$pH, x$dose.kg.t, xout = pl, method = 'hyman')$y
  dd <- data.frame(animal = x$animal[1], pH = pl, dose.kg.t = y1)
  pHi1 <- rbind(pHi1, dd)
}

# Method 2
# Interpolate all curves to exactly pH of 6.0 and 6.6
# Note that values below 0 are set to 0!!
pHint2 <- data.frame()
for (x in split(dat, dat$id)) {
  pl <- c(6.0, 6.6)
  y1 <- spline(x$pH, x$dose.kg.t, xout = pl, method = 'hyman', ties = mean)$y
  y1[y1 < 0] <- 0
  dd <- data.frame(id = x$id[1], pH = pl, dose.kg.t = y1)
  pHint2 <- rbind(pHint2, dd)
}

pHint2 <- merge(pHint2, setup[, -5], by = 'id')

# Mean by interpolated pH
# First by sample (n = 2)
pHi2s <- as.data.frame(summarise(group_by(pHint2, animal, sample, pH), n = length(unique(id)), dose.kg.t.s = mean(dose.kg.t), .groups = 'drop'))
# Then animal
pHi2 <- as.data.frame(summarise(group_by(pHi2s, animal, pH), n = length(unique(sample)), dose.kg.t = mean(dose.kg.t.s), dose.kg.t.sd = sd(dose.kg.t.s), .groups = 'drop'))

