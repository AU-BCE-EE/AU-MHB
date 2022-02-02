
datl$sep <- datl$scenario != 'ref'
datl$EF.type <- interaction(datl$sep, datl$incorp.sf)

datl$app.timing.num <- as.integer(datl$app.timing) + as.numeric(datl$EF.type)/10 - 0.2

dd <- subset(datl, scenario %in% c('ref', 'mid'))
ggplot(dd, aes(app.timing.num, EFp.overall, shape = incorp.sf, colour = EF.type)) +
  geom_point() +
  geom_line() +
  geom_line(data = datl, aes(group = interaction(EF.type, app.timing))) +
  ylim(0, 40) +
  facet_grid(app.mthd ~ man.source) 
ggsave('../plots/overall_emis_factors.png', height = 4.8, width = 6.9)
