# Summarize absolute emission data for use as EFs

efdat <- dat[dat$abs.emis.info == 1 & incorp == 'no', ]

range(efdat$emis.perc.N)
range(na.omit(efdat$emis.perc.TAN))

efdat$efTAN <- efdat$emis.perc.TAN / 100
efdat$efTAN[efdat$efTAN > 1] <- 1

efdat$efN <- efdat$emis.perc.N / 100

# Mean by study
studysumm.abs <- aggregate2(efdat, c('efN', 'efTAN'), 
                        by = c('source', 'manure.source'),
                        FUN = list(mean, n = nnotna), na.rm = TRUE)

# Make version of function with arcsine transformation
uci.trans <- function(x, ...) uci(x, trans = 'asin', ...)

ef <- aggregate2(studysumm.abs, c('efN', 'efTAN'), 
                 by = 'manure.source', 
                 FUN = list(n = nnotna, min = min, max = max, uci.trans), na.rm = TRUE)

ef <- rounddf(ef, 3, func = signif)

# Get number of obs and studies
efn <- efdat[, .(n.TAN.obs = nnotna(efTAN), n.TAN.studies = length(unique(source[!is.na(efTAN)])),
                  n.N.obs = nnotna(efN), n.N.studies = length(unique(source[!is.na(efN)]))
                  ), by = 'manure.source']
