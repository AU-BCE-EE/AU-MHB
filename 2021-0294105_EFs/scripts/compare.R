# Compare calculated EFs to those from 2021 EF report

EFs$acid <- EFs$man.trt == 'Barn acidified'

dat.comp <- merge(dat, EFs[EFs$decade == 2010 & EFs$man.trt != 'Field acidified', c('id', 'app.timing', 'app.mthd', 'man.source', 'acid', 'incorp', 't.incorp', 'EFp')],
      by = c('app.timing', 'app.mthd', 'man.source', 'acid', 'incorp', 't.incorp'),
      suffixes = c('', '.report'), all.x = TRUE)
