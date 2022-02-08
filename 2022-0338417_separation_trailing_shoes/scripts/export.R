# Export results

# Complete EF data frame
write.csv(dat, '../output/EF.csv', row.names = FALSE)

# Table 
write.csv(eftab, '../output/EF_table.csv', row.names = FALSE)

# Predictions
write.csv(preds, '../output/preds.csv', row.names = FALSE)
