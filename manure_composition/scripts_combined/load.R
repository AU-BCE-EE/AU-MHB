

d1 <- read.csv('../data/digestate_2020.csv', skip = 1)
d2 <- read.csv('../data/titration_DM_2021.csv', skip = 1)
ddig <- rbindf(d1, d2)

dseg <- read.csv('../data/SEGES.csv', skip = 1)
