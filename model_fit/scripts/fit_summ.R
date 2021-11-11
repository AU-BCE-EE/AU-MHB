# Model fit

d.pred.168.mm <- subset(d.pred.168, meas.tech2 == 'micro met')
d.pred.168.cp <- subset(d.pred.168, man.source %in% c('cat', 'pig'))

fsumm0 <- with(d.pred.168, data.frame(n.obs = length(er.pred), n.pmid = length(unique(pmid)), MBE = mbe(er, er.pred), MAE = mae(er, er.pred), RMSE = rmse(er, er.pred), ME = me(er, er.pred)))
fsumm0 <- rounddf(fsumm0, 3)

dd <- subset(d.pred.168, !is.na(er.pred) & !is.na(er))
fsumm <- as.data.frame(summarise(group_by(dd, app.mthd), n.obs = length(er.pred), n.pmid = length(unique(pmid)), MBE = mbe(er, er.pred), MAE = mae(er, er.pred), RMSE = rmse(er, er.pred), ME = me(er, er.pred)))
fsumm <- rounddf(fsumm, 3)

dd <- subset(d.pred2.168, !is.na(er.pred) & !is.na(er))
fsumm2 <- as.data.frame(summarise(group_by(dd, app.mthd), n.obs = length(er.pred), n.pmid = length(unique(pmid)), MBE = mbe(er, er.pred), MAE = mae(er, er.pred), RMSE = rmse(er, er.pred), ME = me(er, er.pred)))
fsumm2 <- rounddf(fsumm2, 3)

# Repeat 0 without SDU mix and mink chamber results, to get number of obs for figure
fsumm3 <- with(d.pred.168.cp, data.frame(n.obs = length(er.pred), n.pmid = length(unique(pmid)), MBE = mbe(er, er.pred), MAE = mae(er, er.pred), RMSE = rmse(er, er.pred), ME = me(er, er.pred)))
fsumm3 <- rounddf(fsumm3, 3)

# Repeat 0 with only micromet methods, to report fit and number of obs in text
fsumm4 <- with(d.pred.168.mm, data.frame(n.obs = length(er.pred), n.pmid = length(unique(pmid)), MBE = mbe(er, er.pred), MAE = mae(er, er.pred), RMSE = rmse(er, er.pred), ME = me(er, er.pred)))
fsumm4 <- rounddf(fsumm4, 3)

write.csv(fsumm0, '../output/fit_summ0.csv', row.names = FALSE)
write.csv(fsumm, '../output/fit_summ.csv', row.names = FALSE)
write.csv(fsumm2, '../output/fit_summ2.csv', row.names = FALSE)
write.csv(fsumm3, '../output/fit_summ3.csv', row.names = FALSE)
write.csv(fsumm4, '../output/fit_summ4.csv', row.names = FALSE)
