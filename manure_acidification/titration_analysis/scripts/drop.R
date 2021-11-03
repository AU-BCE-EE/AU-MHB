
dat$animal.sample <- paste(dat$animal, dat$sample)
table(dat$sample, dat$animal)

# Drop problem samples
# NTS: Should link this with dropping in acid dose analysis
# NTS: THis here should be only drop needed
dat <- subset(dat, !animal.sample %in% c('So-/smågrise Mikkel Hansen', 'So-/smågrise Ole Jensen. Messing', 
                                         'Afgasset Stadsgård', 'Afgasset Sending', 'Afgasset Limfjord',
                                       'Afgasset Ausungård', 'Slagtesvin Viskum. Svinegylle'))

# Drop extra Horsens samples so that location is not overrepresented
dat <- subset(dat, ! id %in% c('bw', 'bx'))

# Expect 11 digestate samples and 7 sow/piglet 7 slagtsesvin
table(dat$sample, dat$animal)


