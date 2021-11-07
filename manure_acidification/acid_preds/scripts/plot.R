                      
p <- ggplot(dat, aes(dose.kg.t, red, colour = factor(season), group = interaction(sample, season))) +
  geom_line() +
  facet_wrap(~ animal) +
  theme(legend.position = 'top') +
  labs(x = 'Syre (kg/t)', y = 'ALFAM2 beregnede reduk. i fordampning (% af ubehandlet)',
       colour = 'Måned') 
  p
ggsave('../plots/20_red_v_dose.png', height = 4, width = 4)

dd <- droplevels(subset(dat, (season == 'April' | !grepl('^S', animal)))) 
ds <- droplevels(subset(summ25sel, (season == 'April' | !grepl('^S', animal)))) 
p <- ggplot(dd, aes(dose.kg.t, red, colour = factor(season), group = interaction(sample, season))) +
  geom_vline(data = ds, aes(xintercept = rdose.md, colour = factor(season), group = 1), lty = '2121', alpha = 0.5) +
  geom_line() +
  facet_wrap(~ animal) +
  theme(legend.position = 'top') +
  geom_hline(yintercept = 25, col = 'gray55') + 
  coord_cartesian(xlim = c(0, 3.5), ylim = c(0, 30)) +
  labs(x = 'Syre (kg/t)', y = 'ALFAM2 beregnede reduk. i fordampning (% af ubehandlet)',
       colour = 'Måned') 
p
ggsave('../plots/21_red_v_dose_30.png', height = 4.5, width = 4)

dd <- droplevels(subset(datm, red.m <= 50))
p <- ggplot(dd, aes(dose.kg.t, red.m, colour = factor(season))) +
  geom_line() +
  geom_line(aes(dose.kg.t, red.m - red.s), lty = '1111') +
  geom_line(aes(dose.kg.t, red.m + red.s), lty = '1111') +
  facet_wrap(~ animal) +
  theme(legend.position = 'top') +
  labs(x = 'Conc. acid dose (kg/t)', y = 'ALFAM2 calc. reduction in emission (% of untreated)',
       colour = 'Month') 
  p
ggsave('../plots/22_redm_v_dose.png', height = 4, width = 4)

 
p <- ggplot(dd, aes(dose.kg.t, red.m, colour = factor(season), group = interaction(animal, season))) +
  geom_line() +
  facet_wrap(~ animal) +
  theme(legend.position = 'top') +
  labs(x = 'Conc. acid dose (kg/t)', y = 'ALFAM2 calc. reduction in emission (% of untreated)',
       colour = 'Month') 
  p
ggsave('../plots/20_red_v_dose.png', height = 4, width = 4)


dd <- subset(ulcomp, season == 'April')
# Don't ask me why I need the group argument here
ggplot(dd, aes(etype, rdose.kg.t, colour = interaction(animal, sample), group = interaction(animal, sample))) +
  geom_line() +
  geom_point() +
  geom_label(aes(label = sample), size = 1.5) +
  facet_wrap(~ animal) +
  labs(x = 'Type of estimate (model pars)', y = 'Required conc. acid dose for 25% reduction (kg/t)') +
  theme(legend.position = 'none')
ggsave('../plots/23_dose_CL_comp.png', height = 8, width = 6)

ggplot(edat, aes(dose.kg.t, e.rel, colour = sample, shape = factor(season))) +
  geom_line() +
  scale_shape_manual(values = c(1, 19, 2:10)) +
  facet_wrap(~ animal) +
  labs(x = 'Acid dose (kg/g)', y = '168 h relative emission (% applied TAN)', shape = 'Month') +
  scale_colour_discrete(guide = 'none') +
  theme(legend.position = 'top')
ggsave('../plots/24_emis_pred.png', height = 6, width = 6)

dd <- subset(edat, dose.kg.t %in% c(0, 2))
ggplot(dd, aes(dose.kg.t, e.rel, colour = sample, shape = factor(season))) +
  geom_line() +
  scale_shape_manual(values = c(1, 19, 2:10)) +
  facet_wrap(~ animal) +
  labs(x = 'Acid dose (kg/t)', y = '168 h relative emission (% applied TAN)', shape = 'Month') +
  xlim(-0.5, 2.5) +
  scale_colour_discrete(guide = 'none') +
  geom_label(aes(label = sample), size = 1.5) +
  theme(legend.position = 'top')
ggsave('../plots/25_emis_pred_labs.png', height = 6, width = 6)

# pH and reduction plots
ggplot(dat, aes(pH, red, colour = factor(season), group = interaction(animal, sample, season))) +
  geom_line(alpha = 0.5, lty = 2) +
  geom_line(data = pH.summ, aes(pH, red.m, group = interaction(animal, season)), lwd = 2) +
  facet_wrap(~ animal) +
  labs(x = 'Gylle pH', y = 'ALFAM2 beregnede reduk. i fordampning (% af ubehandlet)',
       colour = 'Måned') 
ggsave('../plots/30_red_v_pH.png', height = 6, width = 6)

ggplot(dat, aes(dpH, red, colour = factor(season), group = interaction(animal, sample, season))) +
  geom_line(alpha = 0.5, lty = 2) +
  geom_line(data = dpH.summ, aes(dpH, red.m, group = interaction(animal, season)), lwd = 2) +
  facet_wrap(~ animal) +
  labs(x = expression('Gylle'~Delta*'pH'), y = 'ALFAM2 beregnede reduk. i fordampning (% af ubehandlet)',
       colour = 'Måned') 
ggsave('../plots/31_red_v_dpH.png', height = 6, width = 6)

# Without digestate
dd <- subset(dat, animal != 'Afgasset')
ds <- subset(pH.summ, animal != 'Afgasset')
ggplot(dd, aes(pH, red, colour = factor(season), group = interaction(animal, sample, season))) +
  geom_line(alpha = 0.5, lty = 2) +
  geom_line(data = ds, aes(pH, red.m, group = interaction(animal, season)), lwd = 2) +
  facet_wrap(~ animal, ncol = 2) +
  theme(legend.position = c(0.7, 0.2)) +
  labs(x = 'Gylle pH', y = 'ALFAM2 beregnede reduk. i fordampning (% af ubehandlet)',
       colour = 'Måned') 
ggsave('../plots/32_red_v_pH_no_dig.png', height = 6, width = 6)

dd <- subset(dat, animal != 'Afgasset')
ds <- subset(dpH.summ, animal != 'Afgasset')
ggplot(dd, aes(dpH, red, colour = factor(season), group = interaction(animal, sample, season))) +
  geom_line(alpha = 0.5, lty = 2) +
  geom_line(data = ds, aes(dpH, red.m, group = interaction(animal, season)), lwd = 2) +
  facet_wrap(~ animal) +
  facet_wrap(~ animal, ncol = 2) +
  theme(legend.position = c(0.7, 0.2)) +
  labs(x = expression('Gylle'~Delta*'pH'), y = 'ALFAM2 beregnede reduk. i fordampning (% af ubehandlet)',
       colour = 'Måned') 
ggsave('../plots/33_red_v_dpH_no_dig.png', height = 6, width = 6)
