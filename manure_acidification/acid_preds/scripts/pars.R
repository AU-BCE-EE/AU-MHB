# Get, tweak pars

pars <- ALFAM2pars02

# Upper CL pars (90%)
# From cal_acidification
pars.ul <- pars
pars.ul['man.ph.r1'] <- 0.61
pars.ul['man.ph.r3'] <- 0.17
