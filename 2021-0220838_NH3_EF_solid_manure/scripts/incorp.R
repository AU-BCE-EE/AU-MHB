# Reshapes for looking at relative effects

# Studies with incorporation
incorp.dat <- dat[dat$incorp.info == 1, ]

# Get reference
incorp.l <- split(incorp.dat, incorp.dat$incorp)
incorp.dat <- merge(incorp.l[['no']], incorp.l[['yes']], by = c('source', 'incorp.set'), suffixes = c('.ref', ''))

# Incorporation reduction
incorp.dat$incorp.red.TAN <- 100 * (1 - incorp.dat$emis.perc.TAN / incorp.dat$emis.perc.TAN.ref)
incorp.dat$incorp.red.N <- 100 * (1 - incorp.dat$emis.perc.N / incorp.dat$emis.perc.N.ref)
# Try transformation on ratio (not reduction)
incorp.dat$incorp.rat.TAN <- log10(incorp.dat$emis.perc.TAN / incorp.dat$emis.perc.TAN.ref)
incorp.dat$incorp.rat.N <- log10(incorp.dat$emis.perc.N / incorp.dat$emis.perc.N.ref)

# Strange that some obs give different values for TAN and TN
# These are Hansen and Birkmose (2005) where fTAN varied
# incorp.dat$row.in.file[abs(incorp.dat$incorp.red.TAN / incorp.dat$incorp.red.N - 1) > 0.01]
# incorp.dat[abs(incorp.dat$incorp.red.TAN / incorp.dat$incorp.red.N - 1) > 0.01, ]
# TN values removed below--not appropriate to conclude EF as frac N increased if it was all driven by increase in frac of N that is TAN
# See rows 40 and 41 in spreadsheet
#incorp.dat[abs(incorp.dat$incorp.red.TAN / incorp.dat$incorp.red.N - 1) > 0.01, 'incorp.red.N'] <- NA

# Grouping incorporation timings
incorp.dat$incorp.time.g <- as.numeric(incorp.dat$incorp.time)
#unique(incorp.dat$incorp.time.g)
#table(incorp.dat$incorp.time.g)
incorp.dat$incorp.time.g[incorp.dat$incorp.time.g >= 0 & incorp.dat$incorp.time.g <=1] <- c('0-1h')
incorp.dat$incorp.time.g[incorp.dat$incorp.time.g >= 4 & incorp.dat$incorp.time.g <=6] <- c('4-6h')
incorp.dat$incorp.time.g[incorp.dat$incorp.time.g == 24] <- c('24h')

# Mean by study and incorp.depth
# only for 4-6h
incorp.dat.ef <- incorp.dat[incorp.dat$incorp.time.g == '4-6h', ]

studysumm.incorp <- aggregate2(incorp.dat.ef, c('incorp.red.TAN', 'incorp.red.N', 'incorp.rat.TAN', 'incorp.rat.N'), 
                        by = c('source', 'manure.source', 'incorp.depth'),
                        FUN = list(mean, n = nnotna), na.rm = TRUE)

ef.incorp <- aggregate2(studysumm.incorp, c('incorp.red.TAN', 'incorp.red.N'), 
                 by =  'incorp.depth', 
                 FUN = list(n = nnotna, min = min, max = max, uci), na.rm = TRUE)

ef.incorp <- rounddf(ef.incorp, 3, func = signif)

# With transformation (not used)
ef.incorpt <- aggregate2(studysumm.incorp, c('incorp.rat.TAN', 'incorp.rat.N'), 
                 by =  'incorp.depth', 
                 FUN = list(n = nnotna, min = min, max = max, uci), na.rm = TRUE)

# Get number of obs and studies
ef.incorp.n <- incorp.dat.ef[, .(n.TAN.obs = nnotna(incorp.red.TAN), n.TAN.studies = length(unique(source[!is.na(incorp.red.TAN)])),
                  n.N.obs = nnotna(incorp.red.N), n.N.studies = length(unique(source[!is.na(incorp.red.N)]))
                  ), by = 'incorp.depth']

# Why is n = 3 studies in memo table?
#incorp.dat.ef[, c('incorp.depth', 'source', 'incorp.red.TAN', 'manure.source')]
#subset(incorp.dat, source == 'Hansen and Birkmose (2005)')
