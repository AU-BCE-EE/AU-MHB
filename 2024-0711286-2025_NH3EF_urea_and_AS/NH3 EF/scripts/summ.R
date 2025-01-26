
# select fertilizers of interest: 
df <- df[FertiliserType %in% c('Urea', 'AS', 'UAN'), ]
# Set sort order
# NTS: change?
df[, FertiliserType := factor(FertiliserType, levels = c('AS', 'UAN', 'Urea'))]
# zUrea: Urea, UP: Urea phosphate, AS: Ammonium sulphate, CAN: Calcium ammonium nitrate, 
# DAP: Diammonium phosphate
# UAN: Urea ammonium nitrate, AN: Ammonium nitrate, UAS: Urea ammonium sulphate, 
# MAP: Monoammonium phosphate
# ABC: Ammonium bicarbonate, UUP: Double urea phosphate

# Select micro met data
df <- df[df$Method == 'Micromet', ]
df[, group := 'All micromet']

# Select broadcast application
df <- df[df$Application == 'Broadcast' | df$Application == 'Liquid', ]

# Create Ref key for plots at least
# But base the value on data sorted by median urea emission
# But include others at end below (otherwise have NAs, might be dropped)!
mm <- df[FertiliserType == 'Urea', .(med = median(NH3loss), mn = mean(NH3loss)), by = .(Ref)]
# Sort by median
setorder(mm, med)
ll <- unique(c(mm$Ref, unique(df$Ref)))
# Done here not clean.R to drop unused Refs
df[, RefKey := as.integer(factor(Ref, levels = ll))]
df[, Ref := factor(Ref, levels = ll)]

### Filtering ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# all except Kemmann et al. 2025
df.noK <- df[Ref != 'Kemmann et al. 2025', ]
df.noK[, group := 'noKemmann']

# Country restriction:
df.sub <- df[Country %in% c('Denmark', 'Germany', 'Ireland', 'UK'), ]
df.sub[, group := 'Subset']

# Combine subsets for plotting: 
dff <- rbind(df, df.noK, df.sub)

# Finally, a summary table
cv <- function(x) 100 * sd(x) / mean(x)
dsumm <- aggregate2(dff, 'NH3loss', by = c('FertiliserType', 'group'), 
	            FUN = list(min = min, max = max, mean = mean, med = median, 
		               sd = sd, cv = cv, n = length), sort = FALSE)

