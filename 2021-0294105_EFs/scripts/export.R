# Export results

# Complete EF data frame
write.csv(dat, '../output/EF.csv', row.names = FALSE)

write.csv(preds, '../output/preds.csv', row.names = FALSE)

# Same but with comparison to EF report values
write.csv(dat.comp, '../output/EF_report_comp.csv', row.names = FALSE)

datw <- dcast(dat, app.timing.dk + app.timing + app.mthd + incorp + t.incorp + man.source + man.name ~ acid, value.var = 'EF')
datw$red.acid <- 100 * (1 - datw$`TRUE` / datw$`FALSE`)
write.csv(datw, '../output/EF_acid_comp.csv', row.names = FALSE)
