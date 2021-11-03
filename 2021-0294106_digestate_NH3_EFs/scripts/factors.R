
dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$app.mthd == 'Trailing hose', paste0(' + ', dat$acid), '')), 
                            levels = c('Trailing hose + 0 kg/t', 'Trailing hose + 2.1 kg/t', 'Trailing hose + 7.5 kg/t', 'Trailing hose + 11 kg/t', 'Open slot injection', 'Closed slot injection'),
                            labels = c('Slæbeslange', 'Slæbeslange +\nmarkforsuring (2.1 kg/t)', 'Slæbeslange +\nmarkforsuring (7.5 kg/t)\n', 'Slæbeslange +\nmarkforsuring (11 kg/t)', 'Nedfældning\ni græs\n', 'Nedfældning\npå sort jord')
                           )
dat$app.timing <- factor(dat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat$app.timing.dk <- factor(dat$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))

dat.acomp$app.mthd.nm <- factor(dat.acomp$app.mthd, 
                            levels = c('Trailing hose', 'Open slot injection', 'Closed slot injection')
                           )
dat.acomp$app.timing <- factor(dat.acomp$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat.acomp$app.timing.dk <- factor(dat.acomp$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))


