
dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$acid, ' + acid', '')), 
                            levels = c('Trailing hose', 'Trailing hose + acid', 'Open slot injection', 'Closed slot injection')
                           )

dat$incorp.nm <- factor(dat$incorp, levels = c('None', 'Shallow', 'Deep'))
dat$app.timing <- factor(dat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat$man.source.nm <- factor(dat$man.source, levels = c('Cattle', 'Pig', 'Digestate'))

datw$app.mthd.nm <- factor(datw$app.mthd, 
                            levels = c('Trailing hose', 'Open slot injection', 'Closed slot injection')
                           )
datw$incorp.nm <- factor(datw$incorp, levels = c('None', 'Shallow', 'Deep'))
datw$app.timing <- factor(datw$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
datw$app.timing.dk <- factor(datw$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
datw$man.source.nm <- factor(datw$man.source, levels = c('Cattle', 'Pig', 'Digestate'))


ggplot(dat, aes(app.timing, EFp, shape = incorp.nm, colour = factor(app.mthd.nm))) +
  geom_point() +
  facet_wrap(~ man.source.nm) +
  ylim(0, max(dat$EFp)) +
  labs(x = 'Application period', y = 'Emission factor (% applied TAN)',
       shape = 'Incorporation (shape)', colour = 'Application method\n(color)') + 
  scale_shape_manual(values = c(19, 24, 1)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'right')
ggsave('../plots/emis_factors.png', height = 4.8, width = 6.9)

ggplot(datw, aes(app.timing.dk, red.acid, colour = man.name)) +
  geom_point() +
  ylim(0, max(datw$red.acid)) +
  labs(x = 'Application period', y = 'Reduction in emis. factor (% un-acidified EF)',
       colour = 'Manure source') + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'right')
ggsave('../plots/acid_red.png', height = 4.8, width = 6.9)


