# Plots titration simulations

system('phreeqc titrat_sim1.phrq')

dat <- read.table('titrat1.sel', header = TRUE)

ni <- dat$sim[3]

dat$S <- 1000 * dat$S
dat$Cl <- dat$Cl - dat$Cl[2]
dat$Cl <- 1000 * dat$Cl
dat <- subset(dat, pH > 3.5)

# Cattle subset
c1 <- subset(dat, sim %in% c(1, ni + 0))
c2 <- subset(dat, sim %in% c(1, ni + 1))
c3 <- subset(dat, sim %in% c(1, ni + 2))

# Buffer cap as H2SO4 dose per 0.1 unit change
c1$b <- abs(c(NA, diff(c1$S) / (diff(c1$pH) / 0.2)))
c2$b <- abs(c(NA, diff(c2$S) / (diff(c2$pH) / 0.2)))

# Pig subset
p1 <- subset(dat, sim %in% c(2, ni + 3))
p2 <- subset(dat, sim %in% c(2, ni + 4))
p3 <- subset(dat, sim %in% c(2, ni + 5))
p4 <- subset(dat, sim %in% c(2, ni + 6))

# Buffer cap as H2SO4 dose per 0.1 unit change
p1$b <- abs(c(NA, diff(p1$S) / (diff(p1$pH) / 0.2)))
p2$b <- abs(c(NA, diff(p2$S) / (diff(p2$pH) / 0.2)))

pdf('titration_sims.pdf', height = 11, width = 8.5)

  par(mfrow = c(2, 1))

  plot(pH ~ S, data = c1, type = 'l', xlim = c(0, 80), ylim = c(5, 8), 
       xlab = expression(H[2]*S*O[4]~('mmol'/'kg'[w])), ylab = 'Slurry pH',
       main = 'Cattle slurry pH')
  lines(pH ~ S, data = c2, col = 'red')
  #lines(pH ~ S, data = c3, col = 'blue')
  #legend('bottomleft', c('No loss', 'Eq. 400 ppm', '1 atm'), lty = 1,
  legend('bottomleft', c('No loss', '1 atm'), lty = 1,
         col = c('black', 'red'))
         #col = c('black', 'blue', 'red'))
  grid()

  plot(b ~ pH, data = c2, type = 'l', 
       col = 'red',
       lwd = 2,
       ylim = c(0, 20), 
       xlab = 'Slurry pH', 
       ylab = expression('Buffer intensity'~('mmol'~H[2]*S*O[4]/'kg'[w]~'per 0.2 pH unit')), 
       main = 'Cattle slurry buffer intensity')
  lines(b ~ pH, data = c1)
  grid()

  plot(pH ~ S, data = p1, type = 'l', xlim = c(0, 120), ylim = c(5, 8), 
       xlab = expression(H[2]*S*O[4]~('mmol'/'kg'[w])), ylab = 'Slurry pH',
       main = 'Pig slurry pH')
  lines(pH ~ S, data = p2, col = 'red')
  #lines(pH ~ S, data = p3, col = 'blue')
  #lines(pH ~ I(Cl/2), data = p4, col = 'orange')
  #legend('bottomleft', c('No loss', 'Eq. 400 ppm', '1 atm'), lty = 1,
  legend('bottomleft', c('No loss', '1 atm'), lty = 1,
         col = c('black', 'red'))
         #col = c('black', 'blue', 'red'))
  grid()

  plot(b ~ pH, data = p2, type = 'l', 
       col = 'red',
       lwd = 2,
       ylim = c(0, 20), 
       xlab = 'Slurry pH', 
       ylab = expression('Buffer intensity'~('mmol'~H[2]*S*O[4]/'kg'[w]~'per 0.2 pH unit')), 
       main = 'Pig slurry buffer intensity')
  lines(b ~ pH, data = p1)
  grid()

  #plot(m_Amm ~ pH, data = p1, type = 'l')
  #lines(m_Amm ~ pH, data = p4, col = 'orange')
  #grid()

dev.off()
