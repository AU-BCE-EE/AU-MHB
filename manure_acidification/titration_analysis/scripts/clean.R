
# Reshape
dat <- gather(tit, 'id', 'pH', -dose, na.rm = TRUE)

# Merge in setup data
dat <- merge(dat, setup, by = 'id')

# Dose in kg/t
# H2SO4 was 95% by mass
# Assume density was 1.84 g/mL (= mg/uL) for both 95% and 96% H2SO4
dens <- 1.84
# Convert dose to 96%
# dose originally = uL of 95% H2SO4
# dose = uL of 96% H2SO4 after conversion
dat$dose <- 0.95/0.96 * dat$dose
dat$dose.mg <- dens * dat$dose
# Convert to kg of 96% H2SO4 per tonne of slurry (initial mass) = mg/g
dat$dose.kg.t <- dat$dose.mg / dat$mass
# 96% H2SO4 -> 0.96
dat$dose.mmol <- dat$dose * dens * 0.95 * 1 / 98.116
dat$dose.mmol.kg <- dat$dose.mmol / dat$mass * 1000

# Buffer intensity
dat <- as.data.frame(mutate(group_by(dat, animal, sample), 
                            buff.int = c(NA, - diff(dose.mmol.kg)/diff(pH))
                            )
                    )

# Add pH change
dat <- as.data.frame(mutate(group_by(dat, id), dpH = pH - pH[dose == 0]))
