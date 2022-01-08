# Summarize data

dl <- melt(dat, id.vars = c('source', 'fraction'), measure.vars = c('S.DM', 'A.DM', 'TAN.sep.eff', 'S.emis.perc', 'A.emis.perc'), na.rm = TRUE)
summ <- aggregate(dat[, c('S.DM', 'DM.sep.eff', 'TAN.sep.eff', 'S.emis.perc', 'S.emis.ini')], by = dat[, c('slurry.source', 'fraction')], 
                  FUN = function(x) paste0(round(mean(x, na.rm = TRUE), 1), ' (', sum(!is.na(x)), ')'))
nsumm <- aggregate(dat[, c('S.DM', 'A.DM', 'TAN.sep.eff', 'S.emis.perc', 'A.emis.perc')], by = dat[, c('slurry.source', 'fraction')], FUN = function(x) sum(!is.na(x)))

