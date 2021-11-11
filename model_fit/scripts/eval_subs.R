# 168 hr subset
d.pred.168 <- subset(d.pred, ct == ct.168)

# Fix level names for plots
d.pred.168$app.mthd.nm <- factor(d.pred.168$app.mthd, levels = c('bc', 'bsth', 'ts', 'os', 'cs'), 
                              labels = c('Broadcast', 'Trailing hose', 'Trailing shoe', 'Open slot \ninjection', 'Closed slot \ninjection'))
d.pred.168$man.source[!d.pred.168$man.source %in% c('cat', 'pig')] <- 'other'
d.pred.168$man.source.nm <- factor(d.pred.168$man.source, levels = c('cat', 'pig', 'other'), labels = c('Cattle', 'Pig', 'Other'))

d.pred.168$digestate <- grepl('[Aa]naerobic digestion', paste(d.pred.168$man.trt1, d.pred.168$man.trt2))
