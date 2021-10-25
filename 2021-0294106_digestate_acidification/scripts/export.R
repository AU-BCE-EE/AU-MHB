# Export results

# Complete EF data frame
write.csv(dat, '../output/EF.csv', row.names = FALSE)

# Same but with comparison to EF report values
write.csv(dat.comp, '../output/EF_report_comp.csv', row.names = FALSE)

datw <- dcast(dat, app.timing.dk + app.timing + app.mthd + man.source + man.name ~ acid, value.var = 'EF')
datw$red.acid.2.1 <- 100 * (1 - datw$`2.1 kg/t` / datw$`0 kg/t`)
datw$red.acid.11 <- 100 * (1 - datw$`11 kg/t` / datw$`0 kg/t`)
write.csv(datw, '../output/EF_acid_comp.csv', row.names = FALSE)
