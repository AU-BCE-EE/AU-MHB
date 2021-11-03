

ggplot(dat, aes(as.integer(app.timing), EFp, shape = app.mthd.pnm, colour = app.mthd.pnm)) +
  geom_point() +
  geom_line(lty = 1, alpha = 0.08) +
  facet_wrap(~ man.source) +
  ylim(0, max(dat$EFp)) +
  labs(x = 'Udbringningsperiode', y = 'Emissionsfaktor (% af TAN)',
       shape = '', colour = '') + 
  scale_shape_manual(values = c(19, 24, 6, 20, 1)) +
  scale_x_continuous(breaks = unique(as.integer(dat$app.timing)), labels= unique(dat$app.timing)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'top')
ggsave('../plots/emis_factors.png', height = 4.8, width = 6.9)

ggplot(datw, aes(app.timing, red.acid, colour = man.source)) +
  geom_point() +
  ylim(0, max(datw$red.acid)) +
  labs(x = 'Application period', y = 'Reduction in emis. factor (% un-acidified EF)',
       colour = 'Manure source') + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'right')
ggsave('../plots/acid_red.png', height = 4.8, width = 6.9)


