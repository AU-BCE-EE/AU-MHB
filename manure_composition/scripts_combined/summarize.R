
# Finally, summaries

# First need means by location ("sample") in digestate data
ddigl2 <- as.data.frame(summarise(group_by(ddigl, source, sample, variable), value = mean(value, na.rm = TRUE)))
ddigl2 <- na.omit(ddigl2)

# Combine digestate and SEGES data
dl <- rbindf(dsegl, ddigl2)

ds <- as.data.frame(summarise(group_by(dl, source, variable), 
                              n = sum(!is.na(value)), 
                              mn = mean(value), md = median(value), s = sd(value) ))

