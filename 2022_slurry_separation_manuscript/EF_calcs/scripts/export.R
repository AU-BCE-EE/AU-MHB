# Export results

# Complete EF data frame (big)
write.csv(datl, '../output/EF.csv', row.names = FALSE)
write.csv(datlsumm, '../output/EF_summ.csv', row.names = FALSE)

# Field EFs
write.csv(fdat, '../output/field_EF.csv', row.names = FALSE)

# Field EF summary
write.csv(fdatsumm, '../output/field_EF_summ.csv', row.names = FALSE)
write.csv(fecsumm, '../output/field_EF_summ2.csv', row.names = FALSE)

# Get counts
sepcount <- aggregate2(sep, 'source', by = 'slurry.source', list(n.obs = length, n.studies = function(x) length(unique(x))))
write.csv(sepcount, '../output/sep_counts.csv', row.names = FALSE)



##write.csv(preds, '../output/preds.csv', row.names = FALSE)
##
##datw <- datw[order(datw$app.timing, datw$man.source), ]
##write.csv(datw, '../output/EF_sep_comp.csv', row.names = FALSE)
