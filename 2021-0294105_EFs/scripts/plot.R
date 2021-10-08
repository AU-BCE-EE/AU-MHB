

dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$acid, ' acid', '')), 
                            levels = c('bsth', 'bsth acid', 'os', 'cs'), 
                            labels = c('Trailing hose', 'Trailing hose + acid', 'Open slot injection', 'Closed slot injection')
                           )

dat$incorp.nm <- factor(dat$incorp, levels = c('none', 'shallow', 'deep'), labels = c('None', 'Shallow', 'Deep'))
dat$app.timing <- factor(dat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat$man.source.nm <- factor(dat$man.source, levels = c('cattle', 'pig', 'mix'), labels = c('Cattle', 'Pig', 'Digestate'))

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

