# Average interpolated titration curves

# a = average
adat <- as.data.frame(summarise(group_by(idat, animal, sample, dose.kg.t), n = length(id), pH = mean(pH), buff.int = mean(buff.int)))
# adat used by ALFAM2 etc. for acid predictions 
# Drop rows without n = 2 (pH extends beyond highest value for one sample, causes jumps in means at extremes)
adat <- subset(adat, n >= 2)

# Average by type (animal)
atdat <- as.data.frame(summarise(group_by(adat, animal, dose.kg.t), n = length(unique(sample)), pH = mean(pH), buff.int = mean(buff.int)))

# mmol for some plots
atdat$dose.mmol.kg <- atdat$dose.kg.t * 1/98.116 * 1000


