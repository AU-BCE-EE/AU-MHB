# Export results

# Complete EF data frame
write.csv(dat, '../output/EF.csv', row.names = FALSE)

# Same but with comparison to EF report values
write.csv(dat.comp, '../output/EF_report_comp.csv', row.names = FALSE)

write.csv(dat.acomp, '../output/EF_acid_comp.csv', row.names = FALSE)
