# Get, tweak pars

###load('../../../parameters/parf.RData')
###pars <- parf
###pars['man.ph.r1'] <- 0.66
###pars['man.ph.r3'] <- 0.24

# Alternate newer pars
# Main pars (fixed pH pars included)
pars <- read.csv('../../../model_cal/output/pars.csv', row.names = 1)
ipars <- read.csv('../../../model_cal/output/pars_incorp_med.csv', row.names = 1)

# Get rid of intercepts for incorp pars
ipn <- rownames(ipars)
ipars <- ipars[, 1]
names(ipars) <- ipn
ipars <- ipars[grepl('^incorp', names(ipars))]

# Pick out results from h (with weighting)
p <- as.vector(pars[, 'h'])
names(p) <- rownames(pars)
p <- p[!is.na(p)]
pars <- c(p, ipars)

# Drop unused pars
pars <- pars[!grepl('\\.ts\\.|^ts\\.', names(pars))]


# Upper CL pars (90%)
# From cal_acidification
pars.ul <- pars
pars.ul['man.ph.r1'] <- 0.61
pars.ul['man.ph.r3'] <- 0.17


