
# Reshape
eftab <- dcast(dat, man.dm.dk + man.ph.dk ~ app.timing.dk + app.mthd.dk, value.var = 'EFp')
names(eftab) <- gsub('_', '\n', names(eftab))
# Means (two periods combined)
efmns <- dcast(dat, man.dm.dk + man.ph.dk ~ app.mthd.dk, fun.aggregate = mean, value.var = 'EFp')
names(efmns)[3:4] <- paste0(names(efmns)[3:4], '.gennem')
# Merge in means
eftab <- merge(eftab, efmns, by = c('man.dm.dk', 'man.ph.dk'), suffixes = c('', '.gennem'))
eftab <- rounddf(eftab, 0, func = round)
eftab <- eftab[order(eftab$man.dm.dk, eftab$man.ph.dk), ]
