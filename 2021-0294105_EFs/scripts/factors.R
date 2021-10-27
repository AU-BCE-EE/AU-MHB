# Sort, name, create factors for tables and plots

dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$acid, ' + acid', ifelse(dat$incorp == 'Deep', ' + deep', ''))), 
                            levels = c('Trailing hose', 'Trailing hose + acid', 'Open slot injection', 'Closed slot injection', 'Trailing hose + deep'),
                            labels = c('Slæbeslange', 'Slæbeslange + markforsuring', 'Nedfældning i græs', 'Nedfældning på sort jord', 'Slæbeslange + Nedbringning inden 4 timer')
                           )

# Include line breaks for plotting name
dat$app.mthd.pnm <- factor(paste0(dat$app.mthd, ifelse(dat$acid, ' + acid', ifelse(dat$incorp == 'Deep', ' + deep', ''))), 
                            levels = c('Trailing hose', 'Trailing hose + acid', 'Open slot injection', 'Closed slot injection', 'Trailing hose + deep'),
                            labels = c('Slæbeslange', 'Slæbeslange +\nmarkforsuring', 'Nedfældning\ni græs', 'Nedfældning\npå sort jord', 'Slæbeslange +\nNedbringning\ninden 4 timer')
                           )

dat$incorp.nm <- factor(dat$incorp, 
                        levels = c('None', 'Shallow', 'Deep'),
                        labels = c('Ikke', 'Shallow', 'Nedbringning\ninden 4 timer'),
                       )
dat$app.timing <- factor(dat$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))

datw$incorp.nm <- factor(datw$incorp, levels = c('None', 'Shallow', 'Deep'))
datw$app.timing <- factor(datw$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
datw$man.source.nm <- factor(datw$man.source, levels = c('Cattle', 'Pig', 'Digestate'))

