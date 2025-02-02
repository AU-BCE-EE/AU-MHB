

pd <- subset(dat, acid != '7.5 kg/t' & man.dm == 5.9)
ggplot(pd, aes(as.integer(app.timing.dk), EFp, shape = app.mthd.nm.lb, colour = app.mthd.nm.lb)) +
  geom_point(size = 3) +
  geom_line(lty = 1, alpha = 0.08) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3)) +
  #facet_grid(~ man.dm.nm) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing.dk)), labels= unique(dat$app.timing.dk)) +
  theme(legend.position = 'top')
ggsave('../plots/emis_factors_sel.png', height = 4.8, width = 6.9)

ggplot(dat, aes(as.integer(app.timing.dk), EFp, shape = app.mthd.nm.lb, colour = factor(man.dm))) +
  geom_point(size = 3) +
  geom_line(lty = 1, alpha = 0.08) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = 'Tørstof') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1, 3)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing.dk)), labels= unique(dat$app.timing.dk)) +
  theme(legend.position = 'top')
ggsave('../plots/emis_factors.png', height = 4.8, width = 7.2)

ggplot(dat.acomp, aes(app.timing.dk, red.acid.3.4)) +
  geom_point(colour = 'red') +
  geom_point(aes(app.timing.dk, red.acid.11), colour = 'blue') +
  geom_point(aes(app.timing.dk, red.acid.7.5), colour = 'orange') +
  ylim(0, max(dat.acomp$red.acid.11)) +
  labs(x = 'Application period', y = 'Reduction in emis. factor (% un-acidified EF)',
       colour = 'Manure source') + 
  theme(legend.position = 'right')
ggsave('../plots/acid_red.png', height = 4.8, width = 6.9)


