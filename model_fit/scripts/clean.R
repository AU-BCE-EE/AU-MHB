# Clean data

# Find earliest time beyond 168 hr (but not longer than 200 hr) for each pmid
d <- as.data.frame(mutate(group_by(d, pmid), 
			  ct.168 = sort(ct[ct >= 168 & ct < 200])[1],
			  ct.72 = sort(ct[ct >= 72 & ct < 78])[1],
			  ct.48 = sort(ct[ct >= 48 & ct < 72])[1],
			  ct.24 = sort(ct[ct >= 24 & ct < 48])[1],
			  ct.0 =  sort(ct[ct > 0 & ct < 24])[1],
			  ct.max.200 = max(ct[ct < 200])[1],
			  ct.max = max(ct))
)

# Set missing values (no ct > 72) to max ct below 78 hr
d$ct.168[is.na(d$ct.168)] <- d$ct.max.200[is.na(d$ct.168)]

# Switch to newer names
names(d) <- gsub('method', 'mthd', names(d))
names(ds) <- gsub('method', 'mthd', names(ds))

# Add er variable to match model preds
d$er <- d$e.rel

# Fill in missing weather with means by pmid
d$missingwind <- d$missingair.temp <- FALSE

for(i in unique(d$pmid)) {
  
  dd <- d[d$pmid == i, ] 
  
  if(any(is.na(dd$wind.2m))) {
    d[d$pmid == i & is.na(d$wind.2m), 'missingwind'] <- TRUE
    d[d$pmid == i & is.na(d$wind.2m), 'wind.2m'] <- mean(na.omit(d[d$pmid == i, 'wind.2m']))
  }
    
  if(any(is.na(dd$air.temp))) {
    d[d$pmid == i & is.na(d$air.temp), 'missingair.temp'] <- TRUE
    d[d$pmid == i & is.na(d$air.temp), 'air.temp'] <- mean(na.omit(d[d$pmid == i, 'air.temp']))
  }
  
}

# Fill in missing pH with 7.0 for cattle, 7.2 for pig
d[is.na(d$man.ph) & d$man.source == 'pig', 'man.ph'] <- 7.2
d[is.na(d$man.ph) & d$man.source == 'cat', 'man.ph'] <- 7.0

d$cereal.hght <- (d$crop == 'cereal') * d$crop.z
d$ts.cereal.hght <- (d$app.mthd == 'ts') * d$cereal.hght
d$ts.cereal.hght[is.na(d$ts.cereal.hght)] <- 0

# Application rate x NOT injection
d$app.rate.ni <- d$app.rate * !(d$app.mthd %in% c('os', 'cs'))

# Set missing rain to 0 with flag
d$flag <- as.character(d$flag)
d$flag[is.na(d$rain)] <- 'r'
d$rain[is.na(d$rain)] <- 0
d$rain.rate[is.na(d$rain.rate)] <- 0

# Drop observations that still have missing wind speed or air temperature
d <- d[!is.na(d$wind.2m) & !is.na(d$air.temp), ]
