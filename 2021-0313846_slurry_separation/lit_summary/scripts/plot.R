

dd <- subset(dat, fraction == 'solid')
ggplot(dd, aes(slurry.source, TAN.sep.eff, colour = source)) + 
  geom_point() +
  labs(x = 'Source', y = 'TAN separation efficiency (%)', colour = '')
ggsave('../plots/TAN_se.png', height = 4, width = 5)

dd <- subset(dat, fraction == 'solid' & !is.na(S.emis.perc))
ggplot(dd, aes(slurry.source, S.emis.perc, colour = source)) + 
  geom_point() +
  labs(x = 'Source', y = 'TAN loss during storage (%)', colour = '')
ggsave('../plots/TAN_stor_emis.png', height = 4, width = 5)

dd <- subset(dat, fraction == 'solid' & !is.na(S.emis.ini))
ggplot(dd, aes(slurry.source, S.emis.ini, colour = source)) + 
  geom_point() +
  labs(x = 'Source', y = 'TAN loss during storage (%)', colour = '')
ggsave('../plots/TAN_stor_emis_ini.png', height = 4, width = 5)

# Compare to ALFAM2 EFs
dd <- subset(dat, slurry.source %in% c('cattle', 'pig') & fraction != 'solid')
dd$slurry.source <- ifelse(dd$slurry.source == 'pig', 'Svinegylle', 'Kvæggylle')
ee <- subset(EFs, man.source %in% c('Svinegylle', 'Kvæggylle') & fraction != 'solid')
ee$slurry.source <- ee$man.source
ee$A.DM <- ee$man.dm
ee$A.emis.perc <- ee$EFp
ee$source <- 'ALFAM2'
ggplot(dd, aes(A.DM, A.emis.perc, shape = fraction, colour = viridis(3)[1])) +
  geom_smooth(aes(group = 1), colour = 'gray75', lty = 1, lwd = 2, alpha = 0.7, method = lm, se = FALSE) +
  geom_point() +
  geom_point(data = ee, colour = viridis(3)[2]) +
  facet_wrap(~ slurry.source) +
  geom_smooth(aes(group = source), method = lm, se = FALSE) +
  geom_smooth(data = ee, aes(group = 1), method = lm, colour = viridis(3)[2], se = FALSE) +
  labs(x = 'Tørstof (%)', y = 'Emissionsfaktor (% af TAN)') +
  theme(legend.position = 'none')
ggsave('../plots/emis_v_DM.png', height = 4, width = 6)

