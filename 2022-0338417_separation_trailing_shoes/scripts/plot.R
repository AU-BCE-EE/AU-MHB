
ggplot(dat, aes(as.integer(app.timing.dk), 100 * EF, shape = app.mthd.dk, fill = app.mthd.dk)) +
  geom_col(position = position_dodge()) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', fill = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing.dk)), labels= unique(dat$app.timing.dk)) +
  facet_grid(man.dm.dk ~ man.ph.dk) +
  theme(legend.position = 'top')
ggsave('../plots/emis_factors_col.png', height = 6, width = 7)

ggplot(dat, aes(man.ph, 100 * EF, colour = man.dm.dk)) +
  geom_point() +
  geom_line() +
  labs(x = 'Gylle pH', y = 'Emissionsfaktor (% af TAN)',
       shape = 'T\u00F8rstof', colour = 'T\u00F8rstof') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3)) +
  facet_grid(app.timing.dk ~ app.mthd.dk) +
  xlim(6.9, 8.3) +
  theme(legend.position = 'top') +
  scale_x_continuous(labels = number_format(decimal.mark = ','))
ggsave('../plots/emis_factors.png', height = 6, width = 7)



