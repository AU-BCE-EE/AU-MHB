# Bootstrap analysis for acid dose required to 6 or 6.6 (method 1)

print('start bootstrap sims')
nsim <- 1000
nsim <- 100
set.seed(123)
# Bootstrap interpolated pH
pl <- c(6.0, 6.3, 6.6)
pHbi <- expand.grid(animal = unique(adat$animal), sim = 1:nsim, pH = pl, dose.kg.t = NA)

for (i in unique(adat$animal)) {

  # Animal subset
  da <- subset(adat, animal == i)
  n.samps <- length(unique(da$sample))

  for (j in 1:nsim) {
    # Bootstrap sample of samples, with replacement
    csamp <- base::sample(unique(da$sample), size = length(unique(da$sample)), replace = TRUE)
    # Sampled data
    ds <- subset(da, sample %in% csamp)
    # Take mean of each dose
    dia <- as.data.frame(summarise(group_by(ds, animal, dose.kg.t), n.sub = sum(n), n.samp = length(unique(sample)), pH = mean(pH), .groups = 'drop'))
    dia <- as.data.frame(mutate(group_by(dia, animal), n.max = max(n.samp)))
    dia <- subset(dia, n.samp == n.max)

    # Interpolate to pH 6 and 6.6
    y1 <- spline(dia$pH, dia$dose.kg.t, xout = pl, method = 'hyman')$y
    pHbi[pHbi$animal == i & pHbi$sim == j & pHbi$pH %in% pl, 'dose.kg.t'] <- y1
    pHbi[pHbi$animal == i & pHbi$sim == j & pHbi$pH %in% pl, 'n.sub'] <- dia$n.sub[1]
  }
  pHbi[pHbi$animal == i, 'n.samp'] <- n.samps

}

# Summarize bootstrap results
pHbsumm <- as.data.frame(summarise(group_by(pHbi, animal, pH), n.samp = n.samp[1], dose.kg.t.mean = mean(dose.kg.t), 
                                   dose.kg.t.se = sd(dose.kg.t), dose.kg.t.90lcl = quantile(dose.kg.t, 0.1), dose.kg.t.90ucl = quantile(dose.kg.t, 0.9), .groups = 'drop'))
# Fudge an sd estimate
pHbsumm$dose.kg.t.sd <- pHbsumm$dose.kg.t.se * sqrt(pHbsumm$n.samp)

print('done')
