# Means of DM and VS by animal type

library(dplyr)
library(readxl)

source('../../../functions/rounddf.R')

dat <- read_xlsx('../data/DM.xlsx', skip = 1)

summ <- as.data.frame(summarise(group_by(dat, animal), 
                                DM.n = sum(!is.na(man.dm)), VS.n = sum(!is.na(man.vs)),
                                DM.mn = mean(man.dm, na.rm = TRUE), VS.mn = mean(man.vs, na.rm = TRUE),
                                DM.sd = sd(man.dm, na.rm = TRUE), VS.sd = sd(man.vs, na.rm = TRUE)))

summ <- rounddf(summ, digits = 2, func = signif)

write.csv(summ, '../output/DM_VS_mean.csv', row.names = FALSE)

