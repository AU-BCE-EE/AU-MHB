
ggplot(d1, aes(ManureDM, e.rel.final, colour = Country, shape = EmissionMeasTechnique)) +
  geom_point() +
  facet_wrap(~ ManureApplicMethod) +
  labs(x = 'Manure DM (%)', y = 'Relative final emission (% applied TAN)',
       shape = 'Measurement tech.', colour = 'Country')
ggsave('../plots/emis_v_sep_DM.png', width = 6, height = 5)

ggplot(d2, aes(ManureDM, e.rel.final, colour = Country, shape = EmissionMeasTechnique)) +
  geom_point() +
  facet_wrap(~ ManureApplicMethod) +
  theme(legend.position = 'right') +
  labs(x = 'Manure DM (%)', y = 'Relative final emission (% applied TAN)',
       shape = 'Measurement tech.', colour = 'Country')
ggsave('../plots/emis_v_DM.png', width = 8, height = 5)


## Check interp of vars
#plot(CumulatEmission ~ NH3CumulEmission72h, data = d1)
#abline(0, 1)
