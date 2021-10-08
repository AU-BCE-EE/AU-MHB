# Get interpolated values needed for acidified EFs

ext <- data.frame(animal = c('Afgasset', 'Kvæg', 'Slagtesvin', 'So-/smågrise'),
                  dose.kg.t = c(11, 3, 2.9, 2.9))

ext <- merge(ext, adat, all = FALSE)

dpH.acidif <- data.frame(tapply(ext$dpH, ext$animal, mean))


