# Get interpolated values needed for acidified EFs

ext <- data.frame(animal = c('Afgasset', 'Kvæg', 'Slagtesvin', 'So-/smågrise'),
                  dose.kg.t = c(11, 3, 2.9, 2.9))

ext <- merge(ext, adat, all = FALSE)

dpH.acidif <- aggregate(ext$dpH, list(animal = ext$animal), mean)
names(dpH.acidif) <- c('animal', 'dpH.mean')
nn <- aggregate(ext$sample, list(animal = ext$animal), function(x) length(unique(x)))
names(nn) <- c('animal', 'n')
dpH.acidif <- merge(dpH.acidif, nn)
