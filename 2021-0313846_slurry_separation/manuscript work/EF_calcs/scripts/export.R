# Export results

# Complete EF data frame
write.csv(datl, '../output/EF.csv', row.names = FALSE)

##write.csv(preds, '../output/preds.csv', row.names = FALSE)
##
##datw <- datw[order(datw$app.timing, datw$man.source), ]
##write.csv(datw, '../output/EF_sep_comp.csv', row.names = FALSE)
