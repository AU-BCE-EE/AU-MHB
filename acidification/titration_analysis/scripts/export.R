# Export interpolated values

write.csv(idat, '../output/titrat_interp.csv', row.names = FALSE)
write.csv(adat, '../output/ave_titrat_interp_sample.csv', row.names = FALSE)
write.csv(atdat, '../output/ave_titrat_interp_animal.csv', row.names = FALSE)

# Acid doses for pH 6 and 6.6
write.csv(pHi1, '../output/ave_pH6_interp_method1.csv', row.names = FALSE)
write.csv(pHbsumm, '../output/ave_pH6_interp_method1_boot.csv', row.names = FALSE)
write.csv(pHi2, '../output/ave_pH6_interp_method2.csv', row.names = FALSE)

# Curve counts
cts <- as.data.frame(summarise(group_by(subset(adat, dose.kg.t == 0), animal), n.samp = length(unique(sample)), n.sub = sum(n)))
write.csv(cts, '../output/n_curves.csv', row.names = FALSE)
