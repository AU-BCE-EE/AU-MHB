
datw <- dcast(dat, app.timing + man.source ~ fraction + incorp, value.var = 'EF')
names(datw)[-1:-2] <- paste0('EF.field.', names(datw)[-1:-2])

nc <- nrow(datw)
ns <- nrow(sep)
datw <- cbind(datw[rep(1:nc, ns), ], sep[rep(1:ns, each = nc), ])

datw$EF.raw.overall <- datw$EF.stor.raw + (1 - datw$EF.stor.raw) * datw$EF.field.raw_none
datw$EF.sep.incorp.overall <- (1 - datw$sep.eff.TAN) * (datw$EF.stor.liquid + (1 - datw$EF.stor.liquid) * datw$EF.field.liquid_none) +
                              datw$sep.eff.TAN * (datw$EF.stor.solid + (1 - datw$EF.stor.solid) * datw$EF.field.solid_deep)
datw$EF.sep.surface.overall <- (1 - datw$sep.eff.TAN) * (datw$EF.stor.liquid + (1 - datw$EF.stor.liquid) * datw$EF.field.liquid_none) +
                              datw$sep.eff.TAN * (datw$EF.stor.solid + (1 - datw$EF.stor.solid) * datw$EF.field.solid_none)

# Make long version for plotting
datl <- melt(datw, id.vars = 1:11, measure.vars = 12:14, value.name = 'EF.overall', variable.name = 'EF.type')
datl$EFp.overall <- 100 * datl$EF.overall

# Spread by scenario for error bar plot
dats <- dcast(datl, app.timing + man.source + EF.type ~ scenario, value.var = 'EFp.overall')
