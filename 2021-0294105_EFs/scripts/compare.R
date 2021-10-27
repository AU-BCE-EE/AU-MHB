# Compare calculated EFs to those from 2021 EF report

EFs$acid <- EFs$man.trt == 'Field acidified'
# To deal with e.g., "Summer, before winter rapeseed"
EFs$app.timing[grepl('Summer', EFs$app.timing)] <- 'Summer'

dat.comp <- merge(dat, EFs[EFs$decade == 2010 & EFs$man.trt != 'Barn acidified', c('id', 'app.timing', 'app.mthd', 'man.source', 'acid', 'incorp', 't.incorp', 'EFp')],
      by = c('app.timing', 'app.mthd', 'man.source', 'acid', 'incorp', 't.incorp'),
      suffixes = c('', '.report'), all.x = TRUE)

# Compare acid 
datw <- dcast(dat, app.timing + app.mthd + incorp + t.incorp + man.source ~ acid, value.var = 'EF')
datw$red.acid <- 100 * (1 - datw$`TRUE` / datw$`FALSE`)
