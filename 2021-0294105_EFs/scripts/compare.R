# Compare calculated EFs to those from 2021 EF report

EFs$acid <- EFs$man.trt == 'Barn acidified'
# To deal with e.g., "Summer, before winter rapeseed"
EFs$app.timing[grepl('Summer', EFs$app.timing)] <- 'Summer'

dat.comp <- merge(dat, EFs[EFs$decade == 2010 & EFs$man.trt != 'Field acidified', c('id', 'app.timing', 'app.mthd', 'man.source', 'acid', 'incorp', 't.incorp', 'EFp')],
      by = c('app.timing', 'app.mthd', 'man.source', 'acid', 'incorp', 't.incorp'),
      suffixes = c('', '.report'), all.x = TRUE)

dat.comp$diff <- round(dat.comp$EFp - dat.comp$EFp.report, 1)
dat.comp$flag <- abs(dat.comp$diff) > 0 & !dat.comp$acid
dat.comp$flag.acid <- abs(dat.comp$diff) > 0
