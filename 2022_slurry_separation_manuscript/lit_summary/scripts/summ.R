# Summarize data

# Long data frame for use below
dl <- melt(dat, id.vars = c('source', 'sep.meth', 'slurry.source', 'set', 'frac'), 
           measure.vars = c('DM', 'TAN.sep.eff', 'pH'), na.rm = TRUE)

# Spread out fractions
dw <- dcast(dl, source + sep.meth + slurry.source + set ~ variable + frac, value.var = 'value')
names(dw) <- gsub('_', '.', names(dw))

# Change in DM due to separation
dw$dDM.lf <- dw$DM.lf - dw$DM.raw
dw$dDM.sf <- dw$DM.sf - dw$DM.raw
dw$rdDM.lf <- 100 * dw$dDM.lf / dw$DM.raw
dw$rdDM.sf <- 100 * dw$dDM.sf / dw$DM.raw

# Change in pH due to separation
dw$dpH.lf <- dw$pH.lf - dw$pH.raw
dw$dpH.sf <- dw$pH.sf - dw$pH.raw

# Now summarize
ds <- aggregate2(dw, c('DM.raw', 'DM.lf', 'DM.sf', 'rdDM.lf', 'rdDM.sf', 
                       'pH.raw', 'pH.lf', 'pH.sf', 'dpH.lf', 'dpH.sf', 
                       'TAN.sep.eff.lf', 'TAN.sep.eff.sf'),
                 by = c('sep.meth', 'slurry.source'),
                 FUN = list(mean = function(x) mean(x, na.rm = TRUE), sd = function(x) sd(x, na.rm = TRUE), n = function(x) sum(!is.na(x))))

ds <- rounddf(ds, 3, fun = signif)
