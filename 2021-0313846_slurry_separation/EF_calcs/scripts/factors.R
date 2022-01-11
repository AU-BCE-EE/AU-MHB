# Sort, name, create factors for tables and plots

dat$app.timing <- factor(dat$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
dat$fraction.nm <- factor(dat$fraction, levels = c('solid', 'liquid', 'raw'), labels = c('Fiber', 'Væske', 'Ubehandlet'))
dat$incorp.nm <- factor(dat$incorp, levels = c('none', 'deep'), labels = c('Ingen', 'Nedpløjning'))
dat$frac.incorp.nm <- paste0(dat$fraction.nm, ifelse(dat$incorp == 'deep', ' med nedpløjning', ''))
dat$frac.incorp.nm <- factor(dat$frac.incorp.nm, levels = c('Ubehandlet', 'Væske', 'Fiber', 'Fiber med nedpløjning'))

datw$man.source <- factor(datw$man.source, levels = c('Kvæggylle', 'Svinegylle', 'Afgasset biomasse'))
datw$app.timing <- factor(datw$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))

dats$app.timing <- factor(dats$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
dats$EF.type <- factor(dats$EF.type, levels = c('EF.raw.overall', 'EF.sep.incorp.overall', 'EF.sep.surface.overall'),
                        labels = c('Ubehandlet (reference)', 'Separeret med\nnedpløjet fiberfraktion', 'Separeret med\nbredspredt fiberfraktion'))

