
# Drop shallow incorporation for plots
dat <- subset(dat, incorp != 'Shallow')

dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$acid, ' + acid', ifelse(dat$incorp == 'Deep', ' + deep', ''))), 
                            levels = c('Trailing hose', 'Trailing hose + acid', 'Trailing hose + deep', 'Open slot injection', 'Closed slot injection'),
                            labels = c('Slæbeslange', 'Slæbeslange +\nmarkforsuring', 'Slæbeslange +\nNedbringning\ninden 4 timer', 'Nedfældning\ni græs', 'Nedfældning\npå sort jord')
                           )
table(dat$app.mthd.nm)

dat$incorp.nm <- factor(dat$incorp, 
                        levels = c('None', 'Shallow', 'Deep'),
                        labels = c('Ikke', 'Shallow', 'Nedbringning\ninden 4 timer'),
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
datw$incorp.nm <- factor(datw$incorp, levels = c('None', 'Shallow', 'Deep'))
datw$app.timing <- factor(datw$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
datw$app.timing.dk <- factor(datw$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
datw$man.source.nm <- factor(datw$man.source, levels = c('Cattle', 'Pig', 'Digestate'))


plot(1:25, pch = 1:25)
ggplot(dat, aes(as.integer(app.timing.dk), EFp, shape = app.mthd.nm, colour = app.mthd.nm)) +
  geom_point() +
  geom_line(lty = 1, alpha = 0.08) +
  facet_wrap(~ man.source.nm) +
  ylim(0, max(dat$EFp)) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing.dk)), labels= unique(dat$app.timing.dk)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'top')
ggsave('../plots/emis_factors.png', height = 4.8, width = 6.9)

ggplot(datw, aes(app.timing.dk, red.acid, colour = man.name)) +
  geom_point() +
  ylim(0, max(datw$red.acid)) +
  labs(x = 'Application period', y = 'Reduction in emis. factor (% un-acidified EF)',
       colour = 'Manure source') + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'right')
ggsave('../plots/acid_red.png', height = 4.8, width = 6.9)


