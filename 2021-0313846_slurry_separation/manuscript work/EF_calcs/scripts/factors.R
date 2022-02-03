# Sort, name, create factors for tables and plots

datl$app.timing <- factor(datl$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))

datl$app.mthd.rl <- factor(datl$app.mthd.rl, levels = c('Trailing hose', 'Open slot injection'))
datl$sep <- datl$scenario != 'ref'
datl$EF.type <- factor(paste(datl$sep, datl$incorp.sf), 
                       levels = c('FALSE none', 'TRUE none', 'TRUE deep'),
                       labels = c('Reference', 'Separation', 'Separation w/ SF incorporation'))





