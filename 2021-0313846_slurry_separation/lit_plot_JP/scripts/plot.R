ggplot(datA, aes(DM, emis, colour = Separated1)) +
  geom_point() +
  geom_path(aes(x = DM, y = emis, group = number), arrow = arrow(length = unit(0.25, "cm")), color = 'grey') +
  facet_wrap(~ Slurry1, ncol = 3) +
  labs(x = 'Tørstof [%]', y = 'Emissionsfaktor (% af TAN)') +
  theme(legend.position = 'top', legend.title = element_blank())
ggsave('../plots/connected_dataA.png', height = 4.8, width = 6.9)