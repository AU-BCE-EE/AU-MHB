# Load data

dat <- read.xlsx('../data/lit_com.xlsx', sheet = 'emission data', startRow = 3)
dat <- data.table(dat)
dat$row.in.file <- 1:nrow(dat) + 3

# Norm data
normdat <- fread('../data/norm_comp.csv')
