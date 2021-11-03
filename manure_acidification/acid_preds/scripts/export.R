

write.csv(summ, '../output/dose_summ.csv', row.names = FALSE)
write.csv(summ25, '../output/25_summ.csv', row.names = FALSE)
write.csv(summ25seltxt, '../output/25sel_summ_txt.csv', row.names = FALSE)
write.csv(summ25sel, '../output/25sel_summ.csv', row.names = FALSE)
write.csv(oa25, '../output/25_overall.csv', row.names = FALSE)
write.csv(e0summ, '../output/untreated_emis.csv', row.names = FALSE)
write.csv(idat.digpH, '../output/digestate_pH_red.csv', row.names = FALSE)

# Get DM and initial pH for table
dmph <- merge(titrat.orig, dm, by = c('sample', 'animal'))
dmph <- subset(dmph, dose.kg.t == 0)[, c('sample', 'animal', 'pH', 'man.dm', 'man.vs')]
# Add numbers
dmph <- dmph[order(dmph$animal, dmph$sample), ]
dmph <- as.data.frame(mutate(group_by(dmph, animal), id = paste(animal, 1:length(animal))))
dmph <- dmph[, c('sample', 'animal', 'id', 'pH', 'man.dm', 'man.vs')]
dmph <- rounddf(dmph, digits = 3, func = signif)
write.csv(dmph, '../output/DM_pH_sample.csv', row.names = FALSE)

# Get DM and initial pH means from data used in calculations
dmph <- subset(dat, dose.kg.t == 0 & month == 4)[, c('sample', 'animal', 'pH', 'man.dm', 'man.vs')]
# Add numbers
dmph <- dmph[order(dmph$animal, dmph$sample), ]
dmph <- as.data.frame(mutate(group_by(dmph, animal), id = paste(animal, 1:length(animal))))
dmph <- dmph[, c('sample', 'animal', 'id', 'pH', 'man.dm', 'man.vs')]
# Take means
dmphmn <- as.data.frame(summarise(group_by(dmph, animal), 
                                  n = length(man.dm), DM.mean = mean(man.dm), pH.mean = mean(pH),
                                  DM.sd = sd(man.dm), pH.sd = sd(pH)))
dmphmn <- rounddf(dmphmn, digits = 3, func = signif)
dmph <- rounddf(dmph, digits = 3, func = signif)
write.csv(dmph, '../output/DM_pH_sample_sel.csv', row.names = FALSE)
write.csv(dmphmn, '../output/DM_pH_means_sel.csv', row.names = FALSE)


