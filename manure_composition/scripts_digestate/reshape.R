
# Reshape
dl <- melt(dat, id.vars = c('animal', 'sample'), measure.vars = c('TS', 'VS', 'TN', 'TAN', 'pH'))
