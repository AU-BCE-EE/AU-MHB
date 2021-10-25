
dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$app.mthd == 'Trailing hose', paste0(' + ', dat$acid), '')), 
                            levels = c('Trailing hose + 0 kg/t', 'Trailing hose + 2.1 kg/t', 'Trailing hose + 11 kg/t', 'Open slot injection', 'Closed slot injection'),
                            labels = c('Slæbeslange', 'Slæbeslange +\nmarkforsuring (2.1 kg/t)', 'Slæbeslange +\nmarkforsuring (11 kg/t)', 'Nedfældning\ni græs', 'Nedfældning\npå sort jord')
                           )
dat$app.timing <- factor(dat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat$man.source.nm <- factor(dat$man.source, 
                            levels = c('Cattle', 'Pig', 'Digestate'),
                            labels = c('Kvæggylle', 'Svinegylle', 'Afgasset biomasse'),
)
dat$app.timing.dk <- factor(dat$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'), ordered = TRUE)

datw$app.mthd.nm <- factor(datw$app.mthd, 
                            levels = c('Trailing hose', 'Open slot injection', 'Closed slot injection')
                           )
datw$app.timing <- factor(datw$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
datw$app.timing.dk <- factor(datw$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
datw$man.source.nm <- factor(datw$man.source, levels = c('Cattle', 'Pig', 'Digestate'))


ggplot(dat, aes(as.integer(app.timing.dk), EFp, shape = app.mthd.nm, colour = app.mthd.nm)) +
  geom_point(size = 3) +
  geom_line(lty = 1, alpha = 0.08) +
  ylim(0, max(dat$EFp)) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing.dk)), labels= unique(dat$app.timing.dk)) +
  theme(legend.position = 'top')
ggsave('../plots/emis_factors.png', height = 4.8, width = 6.9)

ggplot(datw, aes(app.timing.dk, red.acid.2.1)) +
  geom_point(colour = 'red') +
  geom_point(aes(app.timing.dk, red.acid.11), colour = 'blue') +
  ylim(0, max(datw$red.acid.11)) +
  labs(x = 'Application period', y = 'Reduction in emis. factor (% un-acidified EF)',
       colour = 'Manure source') + 
  theme(legend.position = 'right')
ggsave('../plots/acid_red.png', height = 4.8, width = 6.9)


