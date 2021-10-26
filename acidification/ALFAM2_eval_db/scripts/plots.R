
# Empirical emission vs. pH
ggplot(d3f, aes(man.ph, 100*e.rel, shape = atreat, colour = paste(country, institute, inst))) +
  geom_point() +
  scale_shape_manual(values = c(19, 1)) +
  labs(x = 'Slurry pH', y = 'Emission (% applied TAN)', colour = '', shape = '')
ggsave('../plots/01_emis_v_pH_db.png', height = 3, width = 4)

# Bivariate model performance
ggplot(d3f, aes(100*e.rel, 100*e.rel.pred1, colour = atreat)) +
  geom_abline(intercept = 0, slope = 1, col = 'gray45') +
  geom_point() +
  facet_wrap(~ paste(country, institute, inst)) +
  labs(x = 'Målt fordampning (% af TAN)', y = 'ALFAM2 prædiktion (% af TAN)', colour = '') +
  theme(legend.position = 'top')
ggsave('../plots/02_emis_bivar_db.png', height = 3, width = 5.5)

ggplot(d3, aes(ct, e.rel, group = pmid, colour = acid)) +
  geom_line() +
  geom_line(aes(ct, e.rel.pred1), alpha = 0.3) +
  facet_wrap(~ country)
ggsave('../plots/03_emis_curves_db.png', height = 3, width = 5)

ggplot(d3, aes(ct, e.rel, group = pmid, colour = acid, lty = country)) +
  geom_line() +
  geom_line(aes(ct, e.rel.pred1), alpha = 0.3) +
  facet_wrap(~ pmid)
ggsave('../plots/03_emis_curves2_db.png', height = 13, width = 15)

ggplot(d3, aes(e.rel, e.rel.pred1, group = pmid)) +
  geom_line() +
  facet_wrap(~ country)
ggsave('../plots/04_emis_curves_bivar_db.png', height = 3, width = 5)
