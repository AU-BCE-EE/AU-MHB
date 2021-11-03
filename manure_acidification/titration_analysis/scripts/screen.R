# Identify data entry errors for correction

m1 <- lm(pH ~ poly(dose, 3) * sample, data = dat)
dat$pH.smooth <- predict(m1)
dat$smooth.err <- dat$pH.smooth - dat$pH

dat <- as.data.frame(mutate(group_by(dat, id), dose.max = max(dose)))

x <- subset(dat, abs(smooth.err) > 0.7 & dose != dose.max)
x
