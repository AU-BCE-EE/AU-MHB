

# boxplot with reduction vs fertiliser type and incorporation depth

dw[, interact := factor(interaction(FertiliserType, DepthCat, sep = ' '), 
                        levels = c('AS Unknown', 'Urea Unknown', 'AS 1 - 5 cm', 
				   'Urea 1 - 5 cm', 'AS 5 - 10 cm', 'Urea 5 - 10 cm'))]
dw[, ClayCat1 := factor(ClayCat, levels = c('5 - 9 %', '10 - 19 %', '20 - 39 %', '40 - 70 %'))]
dw[, FertiliserType1 := factor(dw$FertiliserType, levels = c('Urea', 'AS'))]

set.seed(1)
ggplot(dw, aes(DepthCat, rdNH3)) + 
  geom_boxplot(outlier.alpha = 0) + 
  theme_bw() + 
  facet_wrap(~ FertiliserType1) + 
  geom_hline(yintercept = 0, lty = 2, alpha = 0.5) +
  geom_jitter(aes(color = ClayCat1, shape = ClayCat1), width = 0.1, alpha = 0.8) +
  ylab('Emission reduction (% reference)') + xlab(NULL) + 
  scale_x_discrete(labels = c('Unknown','1 to 4 cm', '5 to 10 cm')) + 
  theme(legend.position = 'bottom') + 
  labs(colour = 'Clay content', shape = 'Clay content')
ggsave2x('../plots/incorp_red_box', height = 3, width = 5)


# reduction vs absolute emission, shows that the negative reductions are with low emissions 
ggplot(dw, aes(NH3loss_ref, rdNH3, color = FertiliserType)) + 
  geom_point()
ggsave2x('../plots/incorp_scatter', height = 3, width = 5)


# Line plot showing change in emission
mm <- dw[, .(med = median(NH3loss_ref), mn = mean(NH3loss_ref), n = length(NH3loss_ref)), by = .(Ref, FertiliserType)]
setorder(mm, mn)
ll <- unique(mm$Ref)
dw[, RefKey := as.integer(factor(Ref, levels = ll))]
xlabs <- unique(dw[, .(RefKey, Ref)])
dw[, n.sets := .N, by = Ref]
set.seed(1)
dw[, xr := RefKey + runif(.N, min = -0.5, max = 0.5)]
dw[n.sets == 1, xr := RefKey]

ggplot(dw, aes(xr, NH3loss_ref, colour = Country)) + 
  geom_segment(aes(x = xr, xend = xr, y = NH3loss_ref, yend = NH3loss_treat), arrow = arrow(length = unit(0.2, 'cm')), show.legend = FALSE) +
  geom_point(alpha = 0.4, size = 3) +
  labs(x = '', y = 'Emis. factor (% applied N)') +
  scale_x_continuous(breaks = xlabs$RefKey, labels = xlabs$Ref) +
  theme_bw() +
  coord_flip() +
  theme(legend.position = 'right')
ggsave2x('../plots/incorp_red_line', height = 4, width = 6.5)
