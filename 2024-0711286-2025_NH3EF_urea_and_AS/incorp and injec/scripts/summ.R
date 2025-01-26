

# Long data frame for use below
dl <- melt(df, id.vars = c('Ref', 'set', 'Application', 'id', 'FertiliserType', 'Depth', 'Clay'), 
           measure.vars = c('NH3loss'), na.rm = TRUE)

# Spread out ref and treat
dw <- dcast(dl, Ref + set + FertiliserType + Depth + Clay ~ variable + id, value.var = 'value')

# Relative reduction in NH3 due to incorporation
dw[, rdNH3 := 100 * (1 - NH3loss_treat/ NH3loss_ref)]

# divide depth into categories
# table(dw$Depth, dw$FertiliserType)
dw$DepthCat <- 'Unknown'
dw[Depth >= 1 & Depth < 5, DepthCat := '1 - 4 cm']
dw[Depth >= 5 & Depth <= 10, DepthCat := '5 - 10 cm']

# divide clay content into categories 
# table(dw$Clay, dw$FertiliserType)
# plot(dw$Clay)
dw$ClayCat <- 'Unknown'
dw[Clay >= 5 & Clay < 10, ClayCat := '5 - 9 %']
dw[Clay >= 10 & Clay < 20, ClayCat := '10 - 19 %']
dw[Clay >= 20 & Clay < 40, ClayCat := '20 - 39 %']
dw[Clay >= 40 & Clay <= 70, ClayCat := '40 - 70 %']

# total avg and sd reduction (%)
avgRd <- mean(dw$rdNH3)
sdRd <- sd(dw$rdNH3)

# df for arrow plot 
du <- merge(dl, dw[, c('Ref', 'set', 'rdNH3')], by = c('Ref', 'set'), all = TRUE)

cv <- function(x) 100 * sd(x) / mean(x)
dsumm <- aggregate2(dw, 'rdNH3', by = 'FertiliserType', 
	            FUN = list(min = min, max = max, mean = mean, med = median, 
		               sd = sd, cv = cv, n = length), sort = FALSE)