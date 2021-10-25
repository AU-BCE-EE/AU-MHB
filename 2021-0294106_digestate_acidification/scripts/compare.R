# Compare calculated EFs to those from 2021 EF report

# To deal with e.g., "Summer, before winter rapeseed"
EFs$app.timing[grepl('Summer', EFs$app.timing)] <- 'Summer'

# Add treatment column for merge
dat$man.trt <- ifelse(dat$acid == '0 kg/t', 'None', 'Field acidified')

# Merge
dat.comp <- merge(dat, EFs[EFs$decade == 2010 & EFs$man.trt != 'Barn acidified' & EFs$incorp == 'None', 
                  c('id', 'app.timing', 'app.mthd', 'man.source', 'man.trt', 'incorp', 't.incorp', 'EFp')],
      by = c('app.timing', 'app.mthd', 'man.source', 'man.trt'),
      suffixes = c('', '.report'), all.x = TRUE)
