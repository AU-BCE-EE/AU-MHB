
dat$man.dm.dk <- paste0(gsub('\\.', ',', as.character(dat$man.dm)), '%')
dat$man.dm.dk <- factor(dat$man.dm.dk, levels = sort(unique(dat$man.dm.dk), decreasing = TRUE))

dat$man.ph.c <- as.character(signif(dat$man.ph, 3)) 
dat$man.ph.c <- gsub('^([78])$', '\\1.0', dat$man.ph.c)
dat$man.ph.dk <- paste0('pH ', gsub('\\.', ',', dat$man.ph.c))
dat$man.ph.dk <- factor(dat$man.ph.dk, levels = sort(unique(dat$man.ph.dk), decreasing = TRUE))

dat$app.timing.dk <- factor(dat$app.timing.dk, levels = c('April', 'Sommer'))
