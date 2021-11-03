# Export results

# Complete EF data frame
write.csv(dat, '../output/EF.csv', row.names = FALSE)

# Table 
eftab <- dcast(dat, man.source + app.mthd.nm ~ app.timing, value.var = 'EFp')
write.csv(eftab, '../output/EF_table.csv', row.names = FALSE)

write.csv(preds, '../output/preds.csv', row.names = FALSE)

# Same but with comparison to EF report values
write.csv(dat.comp, '../output/EF_report_comp.csv', row.names = FALSE)

write.csv(datw, '../output/EF_acid_comp.csv', row.names = FALSE)
