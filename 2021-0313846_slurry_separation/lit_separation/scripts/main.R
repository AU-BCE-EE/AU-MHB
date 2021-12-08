# Calculation of emission with ALFAM2 model

rm(list = ls())

source('functions.R')
source('packages.R')
source('load.R')
source('prep.R')
render('predict.Rmd', output_dir = '../logs')

head(dat)
dat$emis.red <- 100 * (1 - dat$emis.sep / dat$emis.un)
dat$emis.red.pred <- 100 * (1 - dat$emis.sep.pred / dat$emis.raw.pred)
dat$dm.red <- dat$DM.un - dat$DM.sep

dat <- subset(dat, !is.na(emis.sep.pred))
table(dat$app.mthd)
dat$app.mthd.nm <- factor(dat$app.mthd, levels = c('broadcast', 'trailing hose', 'unknown'), labels = c('Broadcast', 'Trailing hose', 'Unknown\n(trailing hose)'))

dat$meas.meth[grepl('^indirect', dat$meas.meth)] <- 'IOMT'

ggplot(dat, aes(emis.sep.pred, emis.sep, coulour = app.mthd.nm)) +
  geom_abline(slope = 1, intercept = 0, col = 'gray35') +
  geom_segment(aes(x = emis.raw.pred, y = emis.un, xend = emis.sep.pred, yend = emis.sep, colour = app.mthd.nm), 
               arrow = arrow(length = unit(0.2, 'cm'))) +
  labs(x = 'Calculated emis. (% TAN)', y = 'Measured emis. (% TAN)', colour = '') +
  theme(legend.position = 'top')
ggsave('../plots/emis_comp1.png', height = 5, width = 4)

ggplot(dat, aes(emis.sep.pred, emis.sep, coulour = meas.meth)) +
  geom_abline(slope = 1, intercept = 0, col = 'gray35') +
  geom_segment(aes(x = emis.raw.pred, y = emis.un, xend = emis.sep.pred, yend = emis.sep, colour = meas.meth), 
               arrow = arrow(length = unit(0.2, 'cm'))) +
  labs(x = 'Calculated emis. (% TAN)', y = 'Measured emis. (% TAN)', colour = '') +
  theme(legend.position = 'right')
ggsave('../plots/emis_comp2.png', height = 4, width = 6)

ggplot(dat, aes(emis.red.pred, emis.red, colour = dm.red, shape = app.mthd.nm)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, col = 'gray35') +
  scale_colour_viridis_c(option = 'plasma') +
  labs(x = 'Calculated emis. reduction (% of untreated emission)', y = 'Measured emis. reduction (% of untreated emission)',
       colour = 'DM red.\n(% total mass)', shape = '') +
  theme(legend.position = 'right')
ggsave('../plots/emis_reduction_comp1.png', height = 4, width = 5)

