

dd <- subset(dat, frac == 'sf')
ggplot(dd, aes(slurry.source, TAN.sep.eff, colour = source)) + 
  geom_point() +
  labs(x = 'Source', y = 'TAN separation efficiency (%)', colour = '')
ggsave('../plots/TAN_sep_eff.png', height = 4, width = 5)
