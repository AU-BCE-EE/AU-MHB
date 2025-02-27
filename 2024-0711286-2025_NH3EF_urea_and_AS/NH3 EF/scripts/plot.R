# overview of data:

# Plot by fertilizer type and source (Ref) to show values and variability
# All micromet
du <- df[FertiliserType == 'Urea', ]

# Renumber RefKey to eliminate gaps
mm <- du[FertiliserType == 'Urea', .(x1 = RefKey - 0.9, x2 = RefKey + 0.9, med = median(NH3loss), mn = mean(NH3loss), mx = max(NH3loss), n = length(NH3loss)), by = .(Ref, RefKey, Country)]
setorder(mm, med)
xlabs <- unique(du[, .(RefKey, Ref)])
set.seed(1)

ggplot(du, aes(RefKey, NH3loss, colour = Country)) + 
  geom_segment(data = mm, aes(x = x1, xend = x2, y = med, yend = med), show.legend = FALSE) +
  geom_text(y = 54, aes(label = Country), show.legend = FALSE, size = 2.3) +
  geom_jitter(height = 0, alpha = 0.4, size = 0.8) +
  scale_color_discrete(drop = FALSE) +
  labs(x = '', y = 'Emis. factor (% applied N)') +
  scale_x_continuous(breaks = xlabs$RefKey, labels = xlabs$Ref) +
  theme_bw() +
  coord_flip(xlim = c(2, 35)) +
  theme(legend.position = 'none')
ggsave2x('../plots/EF_urea_mm_summ', height = 5, width = 4)

# Repeat for subset
du <- df.sub[FertiliserType == 'Urea', ]
# Renumber RefKey to eliminate gaps
du[, RefKey := as.integer(factor(RefKey))]
mm <- du[, .(x1 = RefKey - 0.9, x2 = RefKey + 0.9, med = median(NH3loss), mn = mean(NH3loss), mx = max(NH3loss), n = length(NH3loss)), by = .(Ref, RefKey, FertiliserType, Country)]
xlabs <- unique(du[, .(RefKey, Ref)])
setorder(xlabs, RefKey)
set.seed(1)
table(du$Country)
table(du$Country)
ggplot(du, aes(RefKey, NH3loss, colour = Country), drop = FALSE) + 
  geom_segment(data = mm, aes(x = x1, xend = x2, y = med, yend = med)) +
  geom_text(y = 54, aes(label = Country), show.legend = FALSE, size = 2.3) +
  geom_jitter(height = 0, alpha = 0.4, size = 0.8) +
  scale_color_discrete(drop = FALSE) +
  labs(x = '', y = 'Emis. factor (% applied N)') +
  scale_x_continuous(breaks = xlabs$RefKey, labels = xlabs$Ref) +
  theme_bw() +
  ylim(0, 60) +
  coord_flip() +
  theme(legend.position = 'none')
ggsave2x('../plots/EF_urea_sub_summ', height = 2, width = 4)

dd <- dff[group != 'noKemmann', ]

dd$FertiliserType1 <- factor(dd$FertiliserType, levels = c('Urea', 'UAN', 'AS'))

ggplot(dd, aes(AirTemperature, NH3loss, color = factor(RefKey), shape = Application)) + 
  geom_smooth(method = lm, se = FALSE, lwd = 0.2) +
  geom_point() +
  facet_grid(FertiliserType1 ~ group) +
  labs(x = expression('Air temperature'~(degree*C)), y = 'Emission factor (% applied N)') +
  theme_bw() +
  theme(legend.position = 'top') +
  guides(colour = 'none')
ggsave2x('../plots/EF_temp', height = 6, width = 4)

ggplot(dd, aes(Clay, NH3loss, color = factor(RefKey), shape = Application)) + 
  geom_smooth(method = lm, se = FALSE, lwd = 0.2) +
  geom_point() +
  facet_grid(FertiliserType1 ~ group) +
  labs(x = 'Soil clay content (%)', y = 'Emission factor (% applied N)') +
  theme_bw() +
  theme(legend.position = 'top') +
  guides(colour = 'none')
ggsave2x('../plots/EF_clay', height = 6, width = 4)

