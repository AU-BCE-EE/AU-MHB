
# Reshape
ddigl <- melt(ddig, id.vars = c('source', 'sample'), measure.vars = c('DM', 'VS', 'TN', 'TAN', 'pH'))

# Reshape
dsegl <- melt(dseg, id.vars = c('plannr', 'lbnr', 'source', 'date', 'decade'), measure.vars = c('DM', 'pH', 'TN', 'TAN'))


