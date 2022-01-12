
# SEGES data
# Blanks
dseg[dseg == ''] <- NA

dseg$date <- mdy(dseg$date)

dseg$year <- year(dseg$date)
dseg$decade <- paste0(substr(dseg$year, 1, 3), '0')

# Subset
dseg <- droplevels(dseg[dseg$source %in% c('Gylle, kvæg', 'Gylle, køer', 'Gylle, svin', 
                                        'Gylle afgasset', 'Gylle, kvæg Markforsuring',
                                        'Gylle, svin Markforsuring'), ])
dim(dseg)

# Remove apparent duplicates (all without dates)
dseg <- dseg[!is.na(dseg$date), ]

# Drop obs without needed variables
dseg <- dseg[!is.na(dseg$DM + dseg$TAN + dseg$TN + dseg$pH), ]
dim(dseg)

# Look for other duplicates
dim(dseg)
dseg <- dseg[!duplicated(dseg[, c('source', 'DM', 'TN', 'TAN')]), ]
dim(dseg)

# Drop obs with TAN > TN
dseg <- dseg[dseg$TAN < dseg$TN, ]
dim(dseg)

# Drop obs with high DM
dseg <- dseg[dseg$DM <= 10, ]

# Use only 2010s, and cattle and pig
dseg <- dseg[dseg$decade == 2010 & dseg$source %in% c('Gylle, kvæg', 'Gylle, svin'), ]
dim(dseg)

# Check ranges
summary(dseg)

# Digestate data
ddig <- ddig[ddig$TS <= 13, ] 
ddig <- ddig[ddig$animal == 'Afgasset', ] 
ddig$DM <- ddig$TS
ddig$source <- ddig$animal
