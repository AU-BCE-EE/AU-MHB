# Create plot

# Measurements and ALFAM2
ggplot(cdat, aes(man.dm, EFp.field, colour = EF.type, lty = EF.type)) +
#  geom_line(aes(group = interaction(source, set)), colour = 'gray75') +
#  geom_point() +
  geom_line(aes(group = interaction(source, set)), stat = 'smooth', se = FALSE, method = lm, formula = y ~ x, alpha = 0.6) +
  facet_wrap(~ man.source) +
  theme_bw() +
  theme(legend.position = 'top') +
  #scale_colour_manual(values = viridis(4)) +
  labs(x = 'Raw slurry or liquid fraction DM (%)', y = 'Emission factor (% of TAN)', colour = '', lty = '')
ggsave('../plots/comp_EF_v_DM.png', height = 3, width = 6)

# Measurements only
dd <- subset(dat, frac.stud != 'mix')
dd <- data.table(dd)
dd[frac.stud != 'raw', comp := 1:length(man.source), by = .(source, set)]

ggplot(dd, aes(man.dm, EFp.field, shape = frac.stud.nm, colour = frac.stud.nm)) +
  geom_line(data = subset(dd, is.na(comp) | comp ==  1), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_line(data = subset(dd, is.na(comp) | comp ==  2), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_line(data = subset(dd, is.na(comp) | comp ==  3), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_line(data = subset(dd, is.na(comp) | comp ==  4), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_line(data = subset(dd, is.na(comp) | comp ==  5), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_line(data = subset(dd, is.na(comp) | comp ==  6), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_line(data = subset(dd, is.na(comp) | comp ==  7), aes(group = interaction(source, set)), colour = 'gray75') +
  geom_point() +
  facet_wrap(~ man.source) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(legend.position = 'top') +
  #scale_colour_manual(values = viridis(4)) +
  labs(x = 'Raw slurry or liquid fraction DM (%)', y = 'Emission factor (% of TAN)', shape = '', colour = '', lty = '')
ggsave('../plots/meas_EF_v_DM.png', height = 3, width = 6)
