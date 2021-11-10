# Compare calculated EFs to those from 2021 EF report
# And calculate acid reductions

# To deal with e.g., "Summer, before winter rapeseed"
EFs$app.timing[grepl('Summer', EFs$app.timing)] <- 'Summer'

# Add treatment column for merge
dat$man.trt <- ifelse(dat$acid == '0 kg/t', 'None', 'Field acidified')

# Merge
dat.comp <- merge(dat, EFs[EFs$decade == 2010 & EFs$man.trt != 'Barn acidified' & EFs$incorp == 'None', 
                  c('id', 'app.timing', 'app.mthd', 'man.source', 'man.trt', 'incorp', 't.incorp', 'EFp')],
      by = c('app.timing', 'app.mthd', 'man.source', 'man.trt'),
      suffixes = c('', '.report'), all.x = TRUE)

# Acid
dat.acomp <- dcast(dat, app.timing.dk + app.timing + app.mthd + man.source + man.dm ~ acid, value.var = 'EF')
dat.acomp$red.acid.3.4 <- 100 * (1 - dat.acomp$`3.4 kg/t` / dat.acomp$`0 kg/t`)
dat.acomp$red.acid.7.5 <- 100 * (1 - dat.acomp$`7.5 kg/t` / dat.acomp$`0 kg/t`)
dat.acomp$red.acid.11 <- 100 * (1 - dat.acomp$`11 kg/t` / dat.acomp$`0 kg/t`)
