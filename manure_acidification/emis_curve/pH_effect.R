# Shows pH effect

rm(list = ls())

library(ALFAM2)
library(ggplot2)

pH <- 40:80/10
dat <- data.frame(ct = 168, TAN.app = 100, man.ph = pH, id = pH)
dat$rain.rate <- 0.06
dat$rain.cum <- dat$rain.rate * dat$ct / 2

# Predictions with default parameters
pred <- ALFAM2mod(dat, group = 'id')
pred$red <- 100 * (1 - pred$er/pred$er[nrow(pred)])
pred$dpH <- pred$id[nrow(pred)] - pred$id

ggplot(pred, aes(id, e)) +
  geom_line() +
  ylim(0, 35) +
  labs(x = 'Slurry pH', y = 'Emission (% of applied TAN)', colour = '')
ggsave('40_emis_v_pH.png', height = 3, width = 3)

ggplot(pred, aes(dpH, red)) +
  geom_line() +
  labs(x = 'Slurry pH', y = 'Emission reduction (% of untreated)', colour = '')
ggsave('41_red_v_dpH.png', height = 3, width = 3)



