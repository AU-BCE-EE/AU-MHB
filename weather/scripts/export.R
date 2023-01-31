
write.csv(dmm, '../output/means.csv', row.names = FALSE)
write.csv(dmms, '../output/means_season.csv', row.names = FALSE)
write.csv(dns, '../output/stat_counts.csv', row.names = FALSE)
write.csv(dno, '../output/stat_tab.csv', row.names = TRUE)
write.csv(fna, '../output/frac_missing.csv', row.names = TRUE)

# STM input
write.csv(dsc, '../output/doy_mean_cold.csv', row.names = FALSE)
write.csv(dsh, '../output/doy_mean_hot.csv', row.names = FALSE)
write.csv(dsm, '../output/doy_mean_mean.csv', row.names = FALSE)

write.csv(dscs, '../output/doy_mean_cold_sel.csv', row.names = FALSE)
write.csv(dshs, '../output/doy_mean_hot_sel.csv', row.names = FALSE)
write.csv(dsms, '../output/doy_mean_mean_sel.csv', row.names = FALSE)
