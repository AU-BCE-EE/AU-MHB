# Sort, name, create factors for tables and plots

dat$app.timing <- factor(dat$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))

datw$man.source <- factor(datw$man.source, levels = c('Kvæggylle', 'Svinegylle', 'Afgasset biomasse'))
datw$app.timing <- factor(datw$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))

dats$app.timing <- factor(dats$app.timing, levels = c('Marts', 'April', 'Maj', 'Sommer', 'Efterår'))
dats$EF.type <- factor(dats$EF.type, levels = c('EF.raw.overall', 'EF.sep.incorp.overall', 'EF.sep.surface.overall'),
                        labels = c('Untreated (reference)', 'Separated with solids incorporation', 'Separated with broadcast solids'))

