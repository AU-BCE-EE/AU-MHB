

ggplot(dat, aes(as.integer(app.timing), EFp, shape = interaction(fraction, incorp), colour = interaction(fraction, incorp))) +
  geom_point() +
  geom_line(lty = 1, alpha = 0.08) +
  facet_wrap(~ man.source) +
  ylim(0, max(dat$EFp)) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'top')
ggsave('../plots/field_emis_factors.png', height = 4.8, width = 6.9)

ggplot(datl, aes(as.integer(app.timing), EFp.overall, shape = EF.type, colour = EF.type)) +
  geom_point() +
  geom_line(lty = 1, alpha = 0.08) +
  facet_grid(scenario ~ man.source) +
  ylim(0, max(datl$EFp.overall)) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'top')

dats$app.timing.num <- as.integer(dats$app.timing) + as.numeric(dats$EF.type)/10 - 0.2
ggplot(dats, aes(app.timing.num, mid, shape = EF.type, colour = EF.type)) +
  geom_point() +
  geom_errorbar(aes(ymin = low, ymax = high), width = 0) +
  geom_line(lty = 1, alpha = 0.08) +
  facet_wrap( ~ man.source) +
  ylim(0, max(datl$EFp.overall)) +
  labs(x = 'Udbringningsperiode', y = 'OVERALL COMBINED Emissionsfaktor (% af TAN)', shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top')
ggsave('../plots/overall_emis_factors.png', height = 4.8, width = 6.9)

