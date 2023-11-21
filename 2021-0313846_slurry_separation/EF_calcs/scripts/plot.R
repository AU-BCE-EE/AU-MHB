
dd <- subset(dat, scenario %in% c('mid', 'reference'))
eb <- subset(dat, fraction == 'liquid')
ebw <- dcast(eb, app.timing + frac.incorp.nm + man.source ~ scenario, value.var = 'EFp')
ebw$lwr <- pmin(ebw$low, ebw$high, ebw$high2)
ebw$upr <- pmax(ebw$low, ebw$high, ebw$high2)
ggplot(dd, aes(as.integer(app.timing), EFp, shape = frac.incorp.nm, colour = frac.incorp.nm)) +
  geom_point() +
  geom_errorbar(data = ebw, aes(y = mid, ymin = lwr, ymax = upr), width = 0) +
  geom_line(aes(group = interaction(fraction, incorp.nm, scenario)), lty = 1, alpha = 0.08) +
  facet_wrap(~ man.source) +
  ylim(0, max(dat$EFp)) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'top')
ggsave('../plots/field_emis_factors.png', height = 4.8, width = 6.9)

dats$app.timing.num <- as.integer(dats$app.timing) + as.numeric(dats$EF.type)/10 - 0.2
dats$highest <- pmax(dats$high, dats$high2)
ggplot(dats, aes(app.timing.num, mid, shape = EF.type, colour = EF.type)) +
  geom_point() +
  geom_errorbar(aes(ymin = low, ymax = highest), width = 0) +
  geom_line(lty = 1, alpha = 0.08) +
  facet_wrap( ~ man.source) +
  ylim(0, max(datl$EFp.overall)) +
  labs(x = 'Udbringningsperiode', y = 'Samlet emissionsfaktor (% af TAN)', shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top')
ggsave('../plots/overall_emis_factors.png', height = 4.8, width = 6.9)


# For JP presentation 231128

dats$app.timing.num <- as.integer(dats$app.timing) + as.numeric(dats$EF.type)/10 - 0.2
dats$highest <- pmax(dats$high, dats$high2)
ggplot(dats, aes(app.timing.num, mid, shape = EF.type, colour = EF.type)) +
  geom_point() +
  theme_bw() + 
  geom_errorbar(aes(ymin = low, ymax = highest), width = 0) +
  geom_line(lty = 1, alpha = 0.08) +
  facet_wrap( ~ man.source) +
  ylim(0, max(datl$EFp.overall)) +
  labs(x = 'Udbringningsperiode', y = 'Samlet emissionsfaktor (% af TAN)', shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top')
ggsave('../plots/overall_emis_factorsA.png', height = 4.8, width = 6.9)

