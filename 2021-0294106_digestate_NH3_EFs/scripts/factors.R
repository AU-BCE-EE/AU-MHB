
dat$app.mthd.nm <- factor(paste0(dat$app.mthd, ifelse(dat$app.mthd == 'Trailing hose', paste0(' + ', dat$acid), '')), 
                            levels = c('Trailing hose + 0 kg/t', 'Trailing hose + 3.4 kg/t', 'Trailing hose + 7.5 kg/t', 'Trailing hose + 11 kg/t', 'Open slot injection', 'Closed slot injection'),
                            labels = c('Slæbeslange', 'Slæbeslange + markforsuring (3,4 kg/t)', 'Slæbeslange + markforsuring (7,5 kg/t)', 'Slæbeslange + markforsuring (11 kg/t)', 'Nedfældning i græs', 'Nedfældning på sort jord')
                           )
dat$app.mthd.nm.lb <- factor(paste0(dat$app.mthd, ifelse(dat$app.mthd == 'Trailing hose', paste0(' + ', dat$acid), '')), 
                            levels = c('Trailing hose + 0 kg/t', 'Trailing hose + 3.4 kg/t', 'Trailing hose + 7.5 kg/t', 'Trailing hose + 11 kg/t', 'Open slot injection', 'Closed slot injection'),
                            labels = c('Slæbeslange', 'Slæbeslange +\nmarkforsuring (3,4 kg/t)', 'Slæbeslange +\nmarkforsuring (7,5 kg/t)\n', 'Slæbeslange +\nmarkforsuring (11 kg/t)', 'Nedfældning\ni græs\n', 'Nedfældning\npå sort jord')
                           )
dat$app.timing <- factor(dat$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat$app.timing.dk <- factor(dat$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))

dat$man.dm.nm <- factor(paste0('Tørstof: ',dat$man.dm, '%'))

dat.acomp$app.mthd.nm <- factor(dat.acomp$app.mthd, 
                            levels = c('Trailing hose', 'Open slot injection', 'Closed slot injection')
                           )
dat.acomp$app.timing <- factor(dat.acomp$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
dat.acomp$app.timing.dk <- factor(dat.acomp$app.timing.dk, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))


