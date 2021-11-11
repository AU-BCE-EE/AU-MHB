
# Main pars (fixed pH pars included)
pars <- read.csv('../../model_cal/output/pars_set2.csv', row.names = 1)
pars <- as.matrix(pars)[, 1]


# Save pars in log
sink('../logs/pars.txt')
  print(pars)
sink()
