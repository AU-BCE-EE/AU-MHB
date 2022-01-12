
dl$source.nm <- factor(dl$source, levels = c('Gylle, svin', 'Gylle, kvæg', 'Afgasset'), labels = c('Svinegylle', 'Kvæggylle', 'Afgasset biomasse'))

dd <- subset(dl, variable == 'DM')
ggplot(dd, aes(source.nm, value, fill = source.nm)) +
  geom_boxplot() +
  labs(x = '', y = 'Tørstof (%)') +
  theme(legend.position = 'none')
ggsave('../plots/DM_box.png', height = 4, width = 4)
