# Means of DM and VS by animal type

library(dplyr)
library(readxl)

source('../../../functions/rounddf.R')

dat <- read_xlsx('../data/DM.xlsx', skip = 1)

summ <- as.data.frame(summarise(group_by(dat, animal), 
                                DM.n = sum(!is.na(man.dm)), VS.n = sum(!is.na(man.vs)),
                                DM.min = min(man.dm, na.rm = TRUE), VS.min = min(man.vs, na.rm = TRUE),
                                DM.max = max(man.dm, na.rm = TRUE), VS.max = max(man.vs, na.rm = TRUE),
                                DM.mn = mean(man.dm, na.rm = TRUE), VS.mn = mean(man.vs, na.rm = TRUE),
                                DM.sd = sd(man.dm, na.rm = TRUE), VS.sd = sd(man.vs, na.rm = TRUE)))

summ <- rounddf(summ, digits = 2, func = signif)

write.csv(summ, '../output/DM_VS_mean.csv', row.names = FALSE)

# Repeat with some dropped samples
dat$animal.sample <- paste(dat$animal, dat$sample)

# Drop problem samples
datd <- subset(dat, !animal.sample %in% c('So-/smågrise Mikkel Hansen', 'So-/smågrise Ole Jensen. Messing', 
                                         'Afgasset Stadsgård', 'Afgasset Sending', 'Afgasset Limfjord',
                                       'Afgasset Ausungård', 'Slagtesvin Viskum. Svinegylle'))

# And drop second Horsens sample
datd <- datd[!duplicated(datd$animal.sample), ]

summd <- as.data.frame(summarise(group_by(datd, animal), 
                                DM.n = sum(!is.na(man.dm)), VS.n = sum(!is.na(man.vs)),
                                DM.min = min(man.dm, na.rm = TRUE), VS.min = min(man.vs, na.rm = TRUE),
                                DM.max = max(man.dm, na.rm = TRUE), VS.max = max(man.vs, na.rm = TRUE),
                                DM.mn = mean(man.dm, na.rm = TRUE), VS.mn = mean(man.vs, na.rm = TRUE),
                                DM.sd = sd(man.dm, na.rm = TRUE), VS.sd = sd(man.vs, na.rm = TRUE)))

summd <- rounddf(summd, digits = 2, func = signif)

write.csv(summd, '../output/DM_VS_drop_mean.csv', row.names = FALSE)

