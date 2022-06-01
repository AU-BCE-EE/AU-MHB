
datlsumm <- aggregate2(datl[, c('EFp.overall'), drop = FALSE], 
                       by = datl[, c('app.timing', 'man.source', 'scenario', 'app.mthd.rl', 'app.mthd.sf', 'incorp.sf')],
                       FUN = list(mean = mean, min = min, max = max, sd = sd, b = boot))


