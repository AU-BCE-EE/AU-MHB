# Export results

write.csv(p1, '../output/cattle_pig_micromet_papers.csv', row.names = FALSE)

# Total counts
write.csv(counts, '../output/tot_counts.csv', row.names = FALSE)

# Emission factor
write.csv(ef, '../output/EF.csv', row.names = FALSE)
write.csv(efn, '../output/EF_counts.csv', row.names = FALSE)

# Emission factor
write.csv(ef.incorp, '../output/incorp.csv', row.names = FALSE)
write.csv(ef.incorp.n, '../output/incorp_counts.csv', row.names = FALSE)

# Source keys
write.csv(source.keys, '../output/source_keys.csv', row.names = FALSE)
