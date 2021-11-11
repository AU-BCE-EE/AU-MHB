
ggplot(dat, aes(source, pH)) +
  geom_violin() + 
  geom_boxplot(width = 0.1) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggtitle('SEGES pH')
ggsave('../plots/SEGES_pH.png', width = 6, height = 5)


