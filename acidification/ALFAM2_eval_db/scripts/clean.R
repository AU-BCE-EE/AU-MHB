
# Switch to newer names
names(d) <- gsub('method', 'mthd', names(d))
names(ds) <- gsub('method', 'mthd', names(ds))

# Make unique experiment codes for acid subset
ds$exper.code <- paste(ds$inst, ds$exper)
d$exper.code <- paste(d$inst, d$exper)

# Application method
d$app.mthd.bc <- d$app.mthd == 'bc'

# Manure source
d$man.source.pig <- d$man.source == 'pig'
