
# Finally, summaries
dsd <- as.data.frame(summarise(group_by(dl, source, decade, variable), 
                              n = length(value),
                              min = min(value), max = max(value), mean = mean(value), 
                              median = median(value), sd = sd(value)))
dsd <- rounddf(dsd, 3)

ds <- as.data.frame(summarise(group_by(dl, source, variable), 
                              n = length(value),
                              min = min(value), max = max(value), mean = mean(value), 
                              median = median(value), sd = sd(value)))
ds <- rounddf(ds, 3)

write.csv(dsd, '../output/slurry_summ_dec.csv', row.names = FALSE)
write.csv(ds, '../output/slurry_summ.csv', row.names = FALSE)

