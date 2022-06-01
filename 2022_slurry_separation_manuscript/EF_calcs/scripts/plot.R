
# Sort out x axis position
datl$app.timing.num <- as.integer(datl$app.timing) + as.numeric(datl$EF.type)/10 - 0.2
datlsumm$app.timing.num <- as.integer(datlsumm$app.timing) + as.numeric(datlsumm$EF.type)/10 - 0.2
fdatsumm$app.timing.num <- as.integer(fdatsumm$app.timing) + as.numeric(fdatsumm$EF.type)/10 - 0.2

ggplot(datlsumm, aes(app.timing.num, EFp.overall.p.mean, shape = EF.type, colour = EF.type)) +
  geom_point(alpha = 0.35) +
  geom_errorbar(aes(ymin = EFp.overall.min, ymax = EFp.overall.max), alpha = 0.4, width = 0) +
  geom_errorbar(aes(ymin = EFp.overall.p.qs.5, ymax = EFp.overall.p.qs.95)) +
  geom_line() +
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(datlsumm$app.timing)), labels= unique(datlsumm$app.timing)) +
  ylim(0, 45) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top') +
  facet_grid(app.mthd.rl ~ man.source)  +
  labs(x = 'Application period', y = 'Overall emission factor (% of initial TAN)', shape = '', colour = '') 
ggsave('../plots/overall_emis_factors.png', height = 6, width = 6)

# Example shows effect of separation performance on overall EF
dd <- subset(datl, app.timing == 'April' & man.source == 'Digestate' & scenario == 'sep' & app.mthd.rl == 'Trailing hose')
## For comparison
#t.test(dd$EFp.overall)
ggplot(dd, aes(rdDM.lf, TAN.sep.eff.sf, size = EFp.overall, colour = dpH.lf)) +
  scale_color_viridis_c() +
  geom_point() +
  #geom_text(aes(x = rdDM.lf + 1.6, label = round(EFp.overall)), size = 3, colour = 'black') +
  geom_text(aes(x = rdDM.lf, label = round(EFp.overall)), colour = 'black') +
  labs(x = 'Relative DM change (% of raw DM)', y = 'TAN separation eff. (% in sf frac.)', size = 'Overall EF (%)', colour = 'Change in pH') +
  theme_bw() +
  theme(legend.position = 'right') 
ggsave('../plots/sep_effect_ex.png', height = 4, width = 5)

dd <- subset(datl, EF.type != 'Reference')
ggplot(dd, aes(app.timing, EFp.overall, fill = EF.type)) +
  geom_boxplot() +
  facet_grid(man.source ~ app.mthd.rl) +
  labs(x = 'Application period', y = 'Overall emission factor (% of applied TAN)', fill = '')  +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top') 
ggsave('../plots/overall_emis_factors_box.png', height = 6, width = 6)

# Compare parameteric and bootstrap CI
ggplot(datlsumm, aes(EFp.overall.b.qs.5, EFp.overall.p.qs.5)) + 
  geom_point() + 
  geom_point(aes(EFp.overall.b.qs.95, EFp.overall.p.qs.95), colour = 'red')
ggsave('../plots/CI_comp.png', height = 6, width = 6)

# Field EFs
ggplot(fdatsumm, aes(app.timing.num, EFp.field.mean, shape = EF.type, colour = EF.type)) +
  geom_point(alpha = 0.35) +
  geom_errorbar(aes(ymin = EFp.field.min, ymax = EFp.field.max), alpha = 0.4, width = 0) +
  geom_errorbar(aes(ymin = EFp.field.p.qs.5, ymax = EFp.field.p.qs.95)) +
  geom_line() +
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(fdatsumm$app.timing)), labels= unique(fdatsumm$app.timing)) +
  ylim(0, 100) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top') +
  facet_grid(app.mthd ~ man.source)  +
  labs(x = 'Application period', y = 'Field application emission factor (% of applied TAN)', shape = '', colour = '') 
ggsave('../plots/field_emis_factors.png', height = 6, width = 6)

# Fraction of overall EFs from storage
ggplot(datlsumm, aes(app.timing.num, stor.frac.EF.mean, shape = EF.type, colour = EF.type)) +
  geom_point(alpha = 0.35) +
  geom_line() +
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(datlsumm$app.timing)), labels= unique(datlsumm$app.timing)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), legend.position = 'top') +
  facet_grid(man.source ~ app.mthd.rl)  +
  labs(x = 'Application period', y = 'Storage contribution to overall EF (%)', shape = '', colour = '') 
ggsave('../plots/stor_contrib.png', height = 6, width = 6)


