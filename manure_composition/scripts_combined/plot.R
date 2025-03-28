
dl$source.nm <- factor(dl$source, levels = c('Gylle, svin', 'Gylle, kvæg', 'Afgasset'), labels = c('Svinegylle', 'Kvæggylle', 'Afgasset biomasse'))

dd <- subset(dl, variable == 'DM')
ggplot(dd, aes(source.nm, value, fill = source.nm)) +
  geom_boxplot() +
  labs(x = '', y = 'Tørstof (%)') +
  theme(legend.position = 'none')
ggsave('../plots/DM_box.png', height = 4, width = 4)

dd <- subset(dl, variable == 'pH')
ggplot(dd, aes(source.nm, value, fill = source.nm)) +
  geom_boxplot() +
  labs(x = '', y = 'pH') +
  theme(legend.position = 'none')
ggsave('../plots/pH_box.png', height = 4, width = 4)

dd <- subset(dl, variable == 'TN')
ggplot(dd, aes(source.nm, value, fill = source.nm)) +
  geom_boxplot() +
  labs(x = '', y = 'Total N (g/kg)') +
  theme(legend.position = 'none')
ggsave('../plots/TotalN_box.png', height = 4, width = 4)

dd <- subset(dl, variable == 'TAN')
ggplot(dd, aes(source.nm, value, fill = source.nm)) +
  geom_boxplot() +
  labs(x = '', y = 'TAN (g/kg)') +
  theme(legend.position = 'none')
ggsave('../plots/TAN_box.png', height = 4, width = 4)

