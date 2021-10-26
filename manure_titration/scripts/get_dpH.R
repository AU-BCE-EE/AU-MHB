# Get interpolated values needed for acidified EFs

ext <- data.frame(animal = c('Afgasset', 'Afgasset', 'Afgasset', 'Kvæg', 'Slagtesvin', 'So-/smågrise'),
                  dose.kg.t = c(11, 5.7, 2.1, 3, 2.9, 2.9))

ext <- merge(ext, adat, all = FALSE)

dpH.acidif <- aggregate(ext$dpH, list(animal = ext$animal, dose.kg.t = ext$dose.kg.t), mean)
names(dpH.acidif) <- c('animal', 'dose.kg.t', 'dpH.mean')
nn <- aggregate(ext$sample, list(animal = ext$animal, dose.kg.t = ext$dose.kg.t), function(x) length(unique(x)))
names(nn)[3] <- 'n'
dpH.acidif <- merge(dpH.acidif, nn)
