
# Change all SoilType to capital letter first (from a mix)
df[, SoilType := gsub('\\b([a-z])', '\\U\\1', SoilType, perl = TRUE)]

# Remove ^z from urea
df[, FertiliserType := sub('^z', '', FertiliserType)]

# Standardize year (from a mix of () and none)
df[, Ref := gsub('\\(|\\)', '', Ref)]
df$Ref
df[, Ref := gsub('et al +', 'et al.', Ref)]
df[, Ref := gsub('et al. +', 'et al.', Ref)]
df[, Ref := gsub('et al', 'et al.', Ref)]
df[, Ref := gsub('et al..', 'et al.', Ref)]
df[, Ref := gsub('et al.', 'et al. ', Ref)]
