# Sort, name, create factors for tables and plots

datl$app.timing <- factor(datl$app.timing, levels = c('March', 'April', 'May', 'Summer', 'Autumn'))

datl$app.mthd <- factor(datl$app.mthd, levels = c('Trailing hose', 'Open slot injection', 'Trailing shoe'))
datl$sep <- datl$scenario != 'ref'
datl$EF.type <- factor(paste(datl$sep, datl$incorp.sf), 
                       levels = c('FALSE none', 'TRUE none', 'TRUE deep'),
                       labels = c('Reference', 'Separation', 'Separation w/ SF incorporation'))





