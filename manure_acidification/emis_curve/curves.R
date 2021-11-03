# Shows emission curves for acidified and unacidified slurry

rm(list = ls())

library(ALFAM2)
library(ggplot2)

# Get, tweak pars
load('../../parameters/parf.RData')
pars <- parf
pars['man.ph.r1'] <- 0.66
pars['man.ph.r3'] <- 0.24

dat <- data.frame(ct = c(0.1, 0:168), TAN.app = 100)
dat$rain.rate <- 0.06
dat$rain.cum <- dat$rain.rate * dat$ct

# Predictions with default parameters
pred1u <- ALFAM2mod(dat, pars = pars, man.ph = 7, wind.2m = 3, air.temp = 13)
pred1a <- ALFAM2mod(dat, pars = pars, man.ph = 6.6, wind.2m = 3, air.temp = 13)
pred2u <- ALFAM2mod(dat, pars = pars, man.ph = 7, wind.2m = 7, air.temp = 20)
pred2a <- ALFAM2mod(dat, pars = pars, man.ph = 6.6, wind.2m = 7, air.temp = 20)

pred1u$trt <- 'Ubehandlet'
pred1a$trt <- 'Forsuret'
pred1 <- rbind(pred1u, pred1a)
pred1$wthr <- 'Gennemsnitlig forhold'

pred2u$trt <- 'Ubehandlet'
pred2a$trt <- 'Forsuret'
pred2 <- rbind(pred2u, pred2a)
pred2$wthr <- 'Høj fordampning'

pred <- rbind(pred1, pred2)

red1 <- 100 * (1 - pred1a$e / pred1u$e)
red1
red2 <- 100 * (1 - pred2a$e / pred2u$e)
red2

red <- data.frame(ct = rep(pred1u$ct, 2), wthr = rep(c('Gennemsnitlig forhold', 'Høj fordampning'), each = length(red1)), red = c(red1, red2))

ggplot(pred, aes(ct, e, colour = trt)) +
  geom_line() +
  facet_wrap(~ wthr) +
  labs(x = 'Tid (h)', y = 'Fordampning (% af TAN)', colour = '') +
  theme(legend.position = 'top')
ggsave('33_emis_pred.png', height = 3, width = 5)

ggplot(red, aes(ct, red, colour = wthr)) +
  geom_line() +
  labs(x = 'Tid (h)', y = 'Reduk. i fordampning (% af ubehandlet)', colour = '') +
  ylim(0, 45) +
  theme(legend.position = 'top')
ggsave('34_red_pred.png', height = 3, width = 3.5)


