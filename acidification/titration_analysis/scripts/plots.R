dat$col <- interaction(dat$sample, dat$animal)
dat$col <- factor(dat$col, levels = sort(unique(dat$col)))
#x <- subset(dat, id %in% c('ab', 'l'))
x <- subset(dat, id %in% c('ab'))

ggplot(dat, aes(dose.mmol.kg, pH, colour = interaction(id, animal))) +
  geom_point() +
  geom_line() +
  facet_wrap(~ animal) +
  labs(x = expression(H[2]*S*O[4]~('mmol'/'kg')), y = 'Slurry pH', colour = 'Sample')
ggsave('../plots/50_titration_curves.png', height = 8.5, width = 11)

ggplot(dat, aes(dose.kg.t, pH, colour = sample, group = id)) +
  geom_point() +
  geom_line() +
  facet_wrap(~ animal) +
  theme(legend.position = 'none') +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = 'Gylle pH', colour = 'Sample')
ggsave('../plots/51_titration_curves_t.png', height = 7, width = 7)

ggplot(dat, aes(dose.kg.t, dpH, colour = sample, group = id)) +
  geom_point() +
  geom_line() +
  facet_wrap(~ animal) +
  theme(legend.position = 'none') +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = expression(Delta*'pH'), colour = 'Sample')
ggsave('../plots/52_titration_curves_dpH_t.png', height = 7, width = 7)

ggplot(x, aes(dose.kg.t, pH)) +
  geom_point() +
  geom_line() +
  ylim(5, 7.5) +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = 'Gylle pH', colour = '')
ggsave('../plots/53_1_titration_curve.png', height = 3, width = 3)

dd <- droplevels(subset(dat, animal != 'Afgasset'))
ggplot(dd, aes(dose.kg.t, buff.int, colour = sample, group = id)) +
  geom_point() +
  geom_line() +
  facet_wrap(~ animal) +
  theme(legend.position = 'none') +
  xlim(0, 2.3) + ylim(0, 177) +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = 'Buffer intensity', colour = 'Sample')
ggsave('../plots/54_buff_int_t.png', height = 4, width = 7)


ggplot(dat, aes(dose.kg.t, pH, group = id)) +
  geom_point(colour = 'gray75') +
  geom_line(colour = 'gray75') +
  geom_point(data = adat, aes(dose.kg.t, pH, colour = sample, group = sample), size = 0.5, shape = 1) +
  geom_line(data = adat, aes(dose.kg.t, pH, colour = sample, group = sample), lty = 2) +
  facet_wrap(~ animal) +
  theme(legend.position = 'none') +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = 'Gylle pH', colour = 'Sample')
ggsave('../plots/55_titration_curves_interp_t.png', height = 7, width = 7)

ggplot(dat, aes(dose.kg.t, pH, group = id)) +
  geom_point(colour = 'gray75', pch = 1) +
  geom_line(colour = 'gray75') +
  geom_line(data = atdat, aes(group = animal), colour = 'gray55', lwd = 1) +
  geom_line(data = pHint1, aes(colour = animal, group = animal), lwd = 1) +
  geom_point(data = pHi1, aes(colour = animal, group = animal), size = 3, pch = 1) +
  facet_wrap(~ animal) +
  theme(legend.position = 'none') +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = 'Gylle pH', colour = 'Sample')
ggsave('../plots/60_pH_interp1.png', height = 7, width = 7)

ggplot(dat, aes(dose.kg.t, pH, group = id)) +
  geom_point(colour = 'gray75', pch = 1) +
  geom_line(aes(colour = sample), alpha = 0.3) +
  geom_point(data = pHint2, aes(colour = sample), size = 2, alpha = 0.9) +
  geom_point(data = pHi2, aes(group = animal), colour = 'gray45', size = 3, pch = 19) +
  geom_point(data = pHi2, aes(group = animal), colour = 'white', size = 1, pch = 19) +
  facet_wrap(~ animal) +
  theme(legend.position = 'none') +
  labs(x = expression('96%'~H[2]*S*O[4]~('kg'/'t')), y = 'Gylle pH', colour = 'Sample')
ggsave('../plots/61_pH_interp2.png', height = 7, width = 7)
