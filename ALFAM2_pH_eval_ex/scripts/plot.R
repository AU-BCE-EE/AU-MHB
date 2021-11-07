# Empirical response ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(dat, aes(e.u, 100*r, colour = ref)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm) +
  theme(legend.position = 'none') +
  labs(x = 'Untreated emission (% applied TAN)', y = 'Acidification reduction (%)', colour = 'Source')
ggsave('../plots/10_acid_red_ex.png', height = 4, width = 4)

dat$dpH <- dat$pH.u - dat$pH.a
ggplot(dat, aes(dpH, 100*r, colour = ref, shape = source)) +
  #geom_smooth(aes(group = 1), se = FALSE, colour = 'gray65') +
  geom_point() +
  geom_smooth(se = FALSE, method = lm) +
  geom_smooth(aes(group = 1), se = FALSE, colour = 'white') +
  scale_shape_manual(values = c(19, 1)) +
  theme(legend.position = 'right') +
  labs(x = 'Forskel i pH', y = 'Reduktion ved forsuring (%)', colour = 'Reference', shape = '')
ggsave('../plots/13_acid_red_ex.png', height = 3.5, width = 6)


ggplot(dat, aes(pH.u, e.u, colour = ref)) +
  geom_point() +
  geom_point(aes(pH.a, e.a), pch = 1) +
  theme(legend.position = 'none') +
  labs(x = 'Slurry pH', y = 'Emission (% applied TAN)', colour = 'Source')
ggsave('../plots/11_emis_v_pH_ex.png', height = 4, width = 4)

#dat$aclass <- cut(dat$pH.a, c(0, 6, 6.5, 8))
dat$aclass <- ifelse(dat$pH.a < 6, 'Acidified pH < 6', 'Acidified pH > 6')
ggplot(dat, aes(aclass, 100*r, fill = ref)) +
  geom_boxplot() +
  labs(x = '', y = 'Acidification reduction (% untreated emis.)', fill = 'Source')
ggsave('../plots/12_red_box_ex.png', height = 4, width = 6)

dds <- as.data.frame(summarise(group_by(dat, ref), pH.mn = mean(pH.a), mn = 100 * mean(r), s = 100 * sd(r)))
ggplot(dds, aes(pH.mn, mn, colour = ref)) +
  geom_point() +
  geom_errorbar(aes(ymin = mn - s, ymax = mn + s), width = 0) +
  ylim(0, 100) +
  labs(x = 'Mean acidified pH', y = 'Acidification reduction (% untreated emis.)', fill = 'Source')
ggsave('../plots/16_red_eb_ex.png', height = 3, width = 5)


# Model evaluation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ggplot(d, aes(pH, e)) +
  geom_point() +
  geom_point(aes(pH, e.pred1), colour = 'red') +
  facet_wrap(~ ref)
ggsave('../plots/emis_v_pH_ex.png', height = 6, width = 6)

d$wt <- grepl('^WT', d$id)
ggplot(d, aes(e, e.pred1, colour = acidified)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, col = 'gray45') +
  facet_wrap(~ ref, scale = 'free') +
  xlim(0, 100) + ylim(0, 100) +
  labs(x = 'Measured relative emission (% applied TAN)', y = 'ALFAM2 calc. relative emission (% applied TAN)', colour = 'Acidified') +
  theme(legend.position = 'top')
ggsave('../plots/14_emis_bivar_ex.png', height = 6, width = 6)

ggplot(dat, aes(e.u, r)) +
  geom_point() +
  geom_point(aes(e.u, r.pred1), colour = 'red') +
  geom_point(aes(e.u.pred1, r.pred1), colour = 'blue') +
  facet_wrap(~ ref)
ggsave('../plots/14_red_v_emis_ex.png', height = 6, width = 6)

ggplot(dat, aes(100*r, 100*r.pred1, colour = ref)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, col = 'gray45') +
#  facet_wrap(~ ref) +
  labs(x = 'Measured acid. reduction (% untreated)',
       y = 'ALFAM2 calc. acid. reduction (% untreated)',
       colour = 'Study') +
  theme(legend.position = 'right')
ggsave('../plots/15_red_bivar_ex.png', height = 4, width = 6)
