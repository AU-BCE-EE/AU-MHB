

d1 <- read.csv('../data/digestate_2020.csv', skip = 1)
d2 <- read.csv('../data/titration_DM_2021.csv', skip = 1)
dat <- rbindf(d1, d2)
