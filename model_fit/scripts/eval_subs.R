
# Fix level names for plots
d.pred$app.mthd.nm <- factor(d.pred$app.mthd, levels = c('bc', 'bsth', 'ts', 'os', 'cs'), 
                              labels = c('Broadcast', 'Trailing hose', 'Trailing shoe', 'Open slot \ninjection', 'Closed slot \ninjection'))
d.pred$man.source[!d.pred$man.source %in% c('cat', 'pig')] <- 'other'
d.pred$man.source.nm <- factor(d.pred$man.source, levels = c('cat', 'pig', 'other'), labels = c('Cattle', 'Pig', 'Other'))

d.pred$digestate <- grepl('[Aa]naerobic digestion', paste(d.pred$man.trt1, d.pred$man.trt2))

# 168 hr subset
d.pred.168 <- subset(d.pred, ct == ct.168)

