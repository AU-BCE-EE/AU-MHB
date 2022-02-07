# Export results

# Complete EF data frame
write.csv(dat, '../output/EF.csv', row.names = FALSE)

# Table 
eftab <- dcast(dat, man.ph.dk ~ man.dm.dk + app.timing.dk  + app.mthd.dk, value.var = 'EFp')
names(eftab) <- gsub('_', '\n', names(eftab))
write.csv(eftab, '../output/EF_table.csv', row.names = FALSE)

# Predictions
write.csv(preds, '../output/preds.csv', row.names = FALSE)
