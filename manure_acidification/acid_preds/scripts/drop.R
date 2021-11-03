# To drop some strange digestate samples with very high DM

# Save for DM export
titrat.orig <- titrat 

titrat$animal.sample <- paste(titrat$animal, titrat$sample)
table(titrat$sample, titrat$animal)

titrat <- subset(titrat, !animal.sample %in% c('So-/smågrise Mikkel Hansen', 'Afgasset Stadsgård', 
                                       'Afgasset Sending', 'Afgasset Limfjord',
                                       'Afgasset Ausungård'))

# Expect only 4 digestate samples and 7 sow/piglet
table(titrat$sample, titrat$animal)

# And drop missing DM samples
dm <- dm[!is.na(dm$man.dm), ]
