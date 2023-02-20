# Create plots

# Boxplot of manure properties ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
dath <- dat[, c('source', 'manure.source.nm', 'meas.meth.nm', 'DM', 'pH', 'TAN', 'totN', 'fTAN')]

brewer.pal(name = 'Spectral', n = 11)

# Long data frame
dathh <- melt(dath, id.vars = c('source', 'manure.source.nm', 'meas.meth.nm'), 
           measure.vars = c('DM', 'TAN', 'pH', 'totN', 'fTAN'), na.rm = TRUE)

# Melt norm data too
ndl <- melt(normdat, id.vars = c('manure.source', 'manure.source.nm', 'manure.source.det'))

ggplot(dathh, aes(manure.source.nm, value)) + 
  theme_bw() + 
  geom_jitter(aes(color = meas.meth.nm), width = 0.1, alpha = 0.35) + 
  geom_boxplot(data = ndl, colour = '#ABDDA4') + 
  geom_boxplot(outlier.alpha = 0, fill = NA) + 
  facet_wrap(~ variable, scales = 'free_y', nrow = 1,
             labeller = as_labeller(c(DM = 'DM (%)', 
                                      TAN = 'TAN (g/kg FM)', 
                                      pH = 'pH', 
                                      totN = 'Total N (g/kg FM)', 
                                      fTAN = 'TAN/total N'))) + 
  ylab(NULL) + xlab(NULL) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  scale_color_manual(values = c("#9E0142", "#3288BD"))
ggsave('../plots/box.png', height = 4, width = 8, scale = 1)

# Incorporation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

incorp.dat$interact <- factor(interaction(incorp.dat$incorp.time.g, incorp.dat$incorp.depth.nm, sep = ' '), 
                              levels = c('0-1h Deep', '4-6h Deep', '24h Deep', '0-1h Shallow',  '4-6h Shallow',  '24h Shallow'))

ggplot(incorp.dat, aes(interact, incorp.red.TAN, color = incorp.depth.nm)) + 
  geom_boxplot(outlier.alpha = 0) + 
  theme_bw() + 
  geom_jitter(width = 0.1, alpha = 0.35) +
  facet_grid( ~ manure.source.nm) +
  ylab('Emission reduction (% reference)') + xlab(NULL) + 
  scale_x_discrete(labels = c('0-1h', '4-6h', '24h', '0-1h', '4-6h', '24h')) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  scale_color_manual(values = c("#9E0142", "#3288BD"))
ggsave('../plots/incorp_red_TAN_g.box.png', height = 4, width = 8)

# Season/temp ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

datt <- dat[dat$timing.info == '1', ]
datt <- datt[! datt$incorp == 'yes', ]
datt <- datt[datt$app.meth == 'broadcast', ]

ggplot(datt, aes(season.nm, emis.perc.TAN, color = source, group = source)) +
  geom_point(size = 3) + 
  facet_wrap(~ manure.source.nm) +
  ylim(0, NA) +
  labs(x = 'Season', y = 'Emission factor (% applied TAN)') + 
  theme_bw() + 
  theme(legend.title = element_blank()) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  scale_color_brewer(palette = 'Spectral')
ggsave('../plots/season_TAN.png', height = 3, width = 6.5)

ggplot(datt, aes(temp.avg, emis.perc.TAN, color = source, group = source)) +
  geom_point(size = 3) + 
  facet_wrap(~ manure.source.nm) +
  ylim(0, NA) +
  labs(x = expression('Average temperature ('*~degree*C*')'), y = 'Emission factor (% applied TAN)') + 
  theme_bw() + 
  theme(legend.title = element_blank()) + 
  scale_color_brewer(palette = 'Spectral')
ggsave('../plots/temp_TAN.png', height = 4, width = 8)

ggplot(datt, aes(season.nm, emis.perc.N, color = source, group = source)) +
  geom_point(size = 3) +
  facet_wrap(~ manure.source.nm) +
  ylim(0, NA) +
  labs(x = 'Season', y = 'Emission factor(% applied N)') + 
  theme_bw() + 
  theme(legend.title = element_blank()) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  scale_color_brewer(palette = 'Spectral')
ggsave('../plots/season_totN.png', height = 4, width = 8)

ggplot(datt, aes(temp.avg, emis.perc.N, color = source, group = source)) +
  geom_point(size = 3) +
  facet_wrap(~ manure.source.nm) +
  ylim(0, NA) +
  labs(x = expression('Average temperature ('*~degree*C*')'), y = 'Emission factor (% applied N)') + 
  theme_bw() +   
  theme(legend.title = element_blank()) +
  scale_color_brewer(palette = 'Spectral')
ggsave('../plots/temp_totN.png', height = 4, width = 8)

# Absolute emission ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# reshaping to have both in a facet_grid
# Long data frame for use below
dl <- melt(efdat, id.vars = c('source', 'season.nm', 'manure.source.nm'), 
           measure.vars = c('emis.perc.TAN', 'emis.perc.N'), na.rm = TRUE)

dl$variable <- as.character(dl$variable)

dl$variable[grepl('^emis.perc.TAN', dl$variable)] <- '% of applied TAN'
dl$variable[grepl('^emis.perc.N', dl$variable)] <- '% of applied N'

ggplot(dl, aes(season.nm, value, colour = source)) +
  geom_point(size = 3) +
  facet_grid(variable ~ manure.source.nm, scales = 'free_y', switch = 'y') +
  ylim(0, NA) +
  labs(x = 'Season', y = 'Emission factor') +
  theme_bw() +
  theme(legend.title = element_blank(), legend.position = 'bottom') + 
  guides(color = guide_legend(nrow = 6)) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + 
  scale_color_brewer(palette = 'Spectral')
ggsave('../plots/EF_both.png', height = 5.5, width = 5)

# Check normality and transformations ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
png('../plots/qqnorm_efTAN.png', height = 500, width = 500)
  qqnorm(efdat$efTAN)
  qqline(efdat$efTAN)
dev.off()

png('../plots/qqnorm_asin_efTAN.png', height = 500, width = 500)
  qqnorm(asin(sqrt(efdat$efTAN)), col = 'red')
  qqline(asin(sqrt(efdat$efTAN)), col = 'red')
dev.off()

png('../plots/qqnorm_efTAN_mean.png', height = 500, width = 500)
  qqnorm(studysumm.abs$efTAN)
  qqline(studysumm.abs$efTAN)
dev.off()

png('../plots/qqnorm_asin_efTAN_mean.png', height = 500, width = 500)
  qqnorm(asin(sqrt(studysumm.abs$efTAN)), col = 'red')
  qqline(asin(sqrt(studysumm.abs$efTAN)), col = 'red')
dev.off()


