
itab <- table(dl$decade, dl$variable, dl$interp)
100 * itab[,,2]/(itab[,,1] + itab[,,2])

mtab <- table(dl$decade, dl$variable, is.na(dl$value))
100 * mtab[,,2]/(mtab[,,1] + mtab[,,2])

# Means
dms <- summarise(group_by(dl, station, variable, decade, month),
                 nd = sum(!is.na(value)), ndt = length(value), 
                 mn1 = mean(value, na.rm = TRUE), s = sd(value, na.rm = TRUE)
                 )

dm <- summarise(group_by(dms, variable, decade, month),
                 nm = length(mn1), 
                 nd = sum(nd), 
                 nstat = length(unique(station)),
                 mn = mean(mn1, na.rm = TRUE), s = sd(mn1, na.rm = TRUE)
                 )

dm <- rounddf(dm, 1)

ds <- dcast(dm, decade + month ~ variable, value.var = 'mn')
ds <- rounddf(ds, 1)

nd <- dcast(dm, decade + month ~ variable, value.var = 'nd')
ns <- dcast(dm, decade + month ~ variable, value.var = 'nstat')

