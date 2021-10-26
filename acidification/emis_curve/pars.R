# Get, tweak pars

load('../../../parameters/parf.RData')
pars <- parf
pars['man.ph.r1'] <- 0.66
pars['man.ph.r3'] <- 0.24

# Upper CL pars (90%)
# From cal_acidification
pars.ul <- pars
pars.ul['man.ph.r1'] <- 0.61
pars.ul['man.ph.r3'] <- 0.17


