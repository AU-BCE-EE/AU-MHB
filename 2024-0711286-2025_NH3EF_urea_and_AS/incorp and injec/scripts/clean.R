
df[, FertiliserType := gsub('zUrea', 'Urea', FertiliserType)]
df[, Ref := gsub('\\(|\\)', '', Ref)]
df[, Ref := gsub('et al ', 'et al. ', Ref)]
