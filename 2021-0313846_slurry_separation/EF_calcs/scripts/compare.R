# Compare calculated EFs to those from 2021 EF report

# Compare acid 
datw <- dcast(dat, app.timing + man.source + app.timing ~ fraction + incorp, value.var = 'EF')
