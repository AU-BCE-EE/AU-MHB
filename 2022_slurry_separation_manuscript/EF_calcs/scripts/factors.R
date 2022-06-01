# Sort, name, create factors for tables and plots

datl$app.timing <- factor(datl$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))

datl$app.mthd.rl <- factor(datl$app.mthd.rl, levels = c('Trailing hose', 'Open slot injection', 'Trailing shoe'))
datl$sep <- datl$scenario != 'ref'
datl$EF.type <- factor(paste(datl$sep, datl$incorp.sf), 
                       levels = c('FALSE none', 'TRUE none', 'TRUE deep'),
                       labels = c('Reference', 'Separation', 'Separation w/ SF incorporation'))

datlsumm$app.timing <- factor(datlsumm$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))

datlsumm$app.mthd.rl <- factor(datlsumm$app.mthd.rl, levels = c('Trailing hose', 'Open slot injection', 'Trailing shoe'))
datlsumm$sep <- datlsumm$scenario != 'ref'
datlsumm$EF.type <- factor(paste(datlsumm$sep, datlsumm$incorp.sf), 
                       levels = c('FALSE none', 'TRUE none', 'TRUE deep'),
                       labels = c('Reference', 'Separation', 'Separation w/ SF incorporation'))


fdatsumm$app.timing <- factor(fdatsumm$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))
fdatsumm$sep <- fdatsumm$scenario != 'ref'
fdatsumm$EF.type <- factor(paste(fdatsumm$stype, fdatsumm$incorp), 
                       levels = c('raw none', 'lf none', 'sf none', 'sf deep'),
                       labels = c('Raw', 'LF', 'SF', 'SF w/ incorporation'))








