
# Reshape field EF data frame
dref <- dat[dat$scenario == 'reference', ]
dref$EF.field.raw.none <- dref$EF
dsep <- dat[dat$scenario != 'reference', ]
datw <- dcast(dsep, scenario + app.timing + app.mthd + man.source ~ fraction + incorp, value.var = 'EF')
names(datw)[-1:-3] <- paste0('EF.field.', gsub('_', '.', names(datw)[-1:-3]))
datw <- merge(datw, dref[, c('app.timing', 'man.source', 'EF.field.raw.none')], by = c('app.timing', 'man.source'))

# Add separation efficiency
datw <- merge(datw, sep, by = 'scenario')

# And storage EFs
datw <- merge(datw, stor, by = 'man.source')

# Calculate overall EFs
# For raw (reference) there is no denitrification loss
datw$EF.raw.overall <- datw$EF.stor.raw + (1 - datw$EF.stor.raw) * datw$EF.field.raw.none
# With separation, TAN is also assumed to be lost through denitrification (see N.loss.stor.solid)
datw$EF.sep.incorp.overall <- (1 - datw$sep.eff.TAN) * (datw$EF.stor.liquid + (1 - datw$EF.stor.liquid) * datw$EF.field.liquid.none) +
                              datw$sep.eff.TAN * (datw$EF.stor.solid + (1 - datw$N.loss.stor.solid) * datw$EF.field.solid.deep)
datw$EF.sep.surface.overall <- (1 - datw$sep.eff.TAN) * (datw$EF.stor.liquid + (1 - datw$EF.stor.liquid) * datw$EF.field.liquid.none) +
                              datw$sep.eff.TAN * (datw$EF.stor.solid + (1 - datw$N.loss.stor.solid) * datw$EF.field.solid.none)

# Make long version for plotting
datl <- melt(datw, id.vars = 1:12, measure.vars = 13:15, value.name = 'EF.overall', variable.name = 'EF.type')
datl$EFp.overall <- 100 * datl$EF.overall

# Spread by scenario for error bar plot
dats <- dcast(datl, app.timing + man.source + EF.type ~ scenario, value.var = 'EFp.overall')
