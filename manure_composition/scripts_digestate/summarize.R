
# Finally, summaries
dsl <- as.data.frame(summarise(group_by(dl, animal, sample, variable), n = length(value), val.sample = mean(value)))
dsl <- na.omit(dsl)
ds <- as.data.frame(summarise(group_by(dsl, animal, variable), 
                              n = sum(!is.na(val.sample)), 
                              mn = mean(val.sample), md = median(val.sample), s = sd(val.sample) ))

ds <- rounddf(ds, 1)

write.csv(dsl, '../output/digestate_summ_sample.csv', row.names = FALSE)
write.csv(ds, '../output/digestate_summ.csv', row.names = FALSE)
