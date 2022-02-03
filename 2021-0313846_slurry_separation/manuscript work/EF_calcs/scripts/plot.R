


datl$app.timing.num <- as.integer(datl$app.timing) + as.numeric(datl$EF.type)/10 - 0.2

dd <- subset(datl, scenario %in% c('ref', 'mid'))
ggplot(dd, aes(app.timing.num, EFp.overall, shape = EF.type, colour = EF.type)) +
  geom_point() +
  geom_line() +
  geom_line(data = datl, aes(group = interaction(EF.type, app.timing))) +
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(datl$app.timing)), labels= unique(datl$app.timing)) +
  ylim(0, 45) +
  theme(legend.position = 'top') +
  facet_grid(man.source ~ app.mthd.rl)  +
  labs(x = 'Application period', y = 'Overall emission factor (% of applied TAN)', shape = '', colour = '') 
ggsave('../plots/overall_emis_factors.png', height = 6, width = 6)
