
ggplot(dat, aes(meas.tech2, e.rel.final, fill = country)) +
  geom_boxplot() +
  ylim(0, 2) 
ggsave('../plots/emis_boxplot.png', width = 6, height = 5)

ggplot(dat, aes(man.dm, e.rel.final, colour = country, shape = meas.tech2)) +
  geom_point() +
  xlim(0, 40) +
  ylim(0, 2) +
  labs(x = 'Manure DM (%)', y = 'Relative final emission (% applied TAN)',
       shape = 'Measurement tech.', colour = 'Country')
ggsave('../plots/emis_v_DM.png', width = 6, height = 5)

ggplot(dat, aes(man.dm, e.rel.final, colour = country, shape = meas.tech2)) +
  geom_smooth(method = lm, formula = y ~ x) +
  xlim(0, 40) +
  ylim(0, 2) +
  labs(x = 'Manure DM (%)', y = 'Relative final emission (% applied TAN)',
       shape = 'Measurement tech.', colour = 'Country')
ggsave('../plots/emis_v_DM_lines.png', width = 6, height = 5)


dd <- subset(dat, !country %in% c('NO', 'US') & meas.tech2 != 'chamber' & !is.na(e.rel.final) & !is.na(man.dm) & !is.na(country))
table(dd$country, dd$meas.tech2)
summary(dd[, c('man.dm', 'e.rel.final', 'country')])
# Why TF does ggplot not have enough points for curve when I include meas.tech2???
ggplot(dd, aes(man.dm, e.rel.final, colour = country)) +
  geom_smooth(method = lm, formula = y ~ poly(x, 3), se = FALSE) +
  xlim(0, 40) +
  ylim(0, 2) +
  labs(x = 'Manure DM (%)', y = 'Relative final emission (% applied TAN)',
       shape = 'Measurement tech.', colour = 'Country')
ggsave('../plots/emis_v_DM_curves.png', width = 6, height = 5)


dd <- subset(dat, !country %in% c('NO', 'US') & meas.tech2 == 'micro met')
table(dd$country, dd$meas.tech2)
ggplot(dd, aes(man.dm, e.rel.final, colour = country)) +
  geom_smooth(method = lm, formula = y ~ poly(x, 3), se = FALSE) +
  xlim(0, 40) +
  ylim(0, 2) +
  labs(x = 'Manure DM (%)', y = 'Relative final emission (% applied TAN)',
       shape = 'Measurement tech.', colour = 'Country')
ggsave('../plots/emis_v_DM_curves_mm.png', width = 6, height = 5)


