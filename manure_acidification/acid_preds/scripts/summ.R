# Calculate emission reductions and interpolate acid dose and change and pH

# First extract dose 0 for emission curves
#edat <- subset(dat, dose.kg.t %in% c(0, 2))
edat0 <- subset(dat, dose.kg.t == 0)
edat <- subset(dat, dose.kg.t <= 6)

# Summarize untreated emission by sample and type
e0summ <- as.data.frame(summarise(group_by(edat0, animal, month), n = length(e.rel), e.rel = mean(e.rel)))

dat <- as.data.frame(mutate(group_by(dat, animal, sample, month), 
                            red = 100 * (1 - e.rel/e.rel[dose.kg.t == 0]),
                            red.ul = 100 * (1 - e.rel.ul/e.rel.ul[dose.kg.t == 0]),
                            dpH = pH[dose.kg.t == 0] - pH
                            ))

# Mean and sd reduction etc. by type and dose
d <- subset(dat, dose.kg.t %in% c(0:4, 5, 10, 20, 25, 30))

summ <- as.data.frame(summarise(group_by(d, animal, month, dose.kg.t),
                                n = length(unique(sample)),
                                pH.m = mean(pH), pH.s = sd(pH), pH.mn = min(pH), pH.mx = max(pH),
                                dpH.m = mean(dpH), dpH.s = sd(dpH), dpH.mn = min(dpH), dpH.mx = max(dpH),
                                e.rel.m = mean(e.rel), e.rel.s = sd(e.rel), e.rel.mn = min(e.rel), e.rel.mx = max(e.rel),
                                red.m = mean(red), red.s = sd(red), red.mn = min(red), red.mx = max(red)))


# Interpolate each curve to a 25% reduction
idat <- data.frame()
target <- 25 # Percent reduction

idat <- as.data.frame(summarise(group_by(dat, sample, animal, man.dm, wind.2m, air.temp, month), 
                      rdose.kg.t = approx(red, dose.kg.t, xout = target)$y,
                      rdose.kg.t.ul = approx(red.ul, dose.kg.t, xout = target)$y,
                      rpH = approx(red, pH, xout = target)$y,
                      rdpH = approx(red, dpH, xout = target)$y,
                      rpH.ul = approx(red.ul, pH, xout = target)$y,
                      rdpH.ul = approx(red.ul, dpH, xout = target)$y))
idat$red <- target

# Summarize dose for 25% reduction by type for report table
summ25 <- as.data.frame(summarise(group_by(idat, animal, month),
                                n = length(unique(sample)),
                                rdose.md = median(rdose.kg.t), rdose.mean = mean(rdose.kg.t), 
                                rdose.ul.md = median(rdose.kg.t.ul), rdose.ul.mean = mean(rdose.kg.t.ul), 
                                rdose.s = sd(rdose.kg.t), rdose.mn = min(rdose.kg.t), rdose.mx = max(rdose.kg.t),
                                rpH.mean = mean(rpH), rpH.s = sd(rpH), rpH.mn = min(rpH), rpH.mx = max(rpH),
                                rdpH.md = median(rdpH), rdpH.mean = mean(rdpH), rdpH.s = sd(rdpH), rdpH.mn = min(rdpH), rdpH.mx = max(rdpH),
                                rdpH.ul.md = median(rdpH.ul), rdpH.ul.mean = mean(rdpH.ul), rdpH.ul.s = sd(rdpH.ul), rdpH.ul.mn = min(rdpH.ul), rdpH.ul.mx = max(rdpH.ul),
                                red.m = target))

# Select summary for table in report
# Note that upper limit ul2 includes var in both model predictions and among titrations
# Is conservative 90% (probably 95% or even higher)
# Sort animals
idat$animal <- factor(idat$animal, levels = c('Kvæg', 'So-/smågrise', 'Slagtesvin', 'Afgasset'))
summ25sel <- as.data.frame(summarise(group_by(idat, month, animal),
                                n = length(rdose.kg.t),
                                rdose.md = median(rdose.kg.t), 
                                rdose.mean = mean(rdose.kg.t), 
                                rdose.s = sd(rdose.kg.t),
                                rdose.ul1 = mean(rdose.kg.t) + qt(0.95, length(rdose.kg.t) - 1) * sd(rdose.kg.t) / sqrt(length(rdose.kg.t)),
                                rdose.ul2 = mean(rdose.kg.t.ul) + qt(0.7, length(rdose.kg.t) - 1) * sd(rdose.kg.t) / sqrt(length(rdose.kg.t)),
                                rdpH.mean = mean(rdpH), 
                                rdpH.s = sd(rdpH),
                                rdpH.ul2 = mean(rdpH.ul) + qt(0.7, length(rdose.kg.t) - 1) * sd(rdpH) / sqrt(length(rdose.kg.t)),
                                ))
summ25sel <- rounddf(summ25sel, func = signif, digits = 2)

# Make character, switch to comma decimal
summ25seltxt <- summ25sel
for (i in 1:ncol(summ25seltxt)) {
  summ25seltxt[, i] <- gsub('\\.', ',', as.character(summ25seltxt[, i]))
}

# Overall requirements
dd <- summ25[, c('animal', 'month', 'rdose.mean')]
dd$agroup <- substr(dd$animal, 1, 1)
dd <- subset(dd, !(agroup == 'S' & month == 6))
oa25 <- as.data.frame(summarise(group_by(dd, agroup), n.vals = length(rdose.mean), n.months = length(unique(month)), n.groups = length(unique(animal)), rdose.oa = mean(rdose.mean)))
oa25 <- rounddf(oa25, 1)

# Mean response for plots
datm <- as.data.frame(summarise(group_by(dat, animal, month, dose.kg.t),
                                n = length(unique(sample)),
                                pH.m = mean(pH), pH.s = sd(pH), pH.mn = min(pH), pH.mx = max(pH),
                                dpH.m = mean(dpH), dpH.s = sd(dpH), dpH.mn = min(dpH), dpH.mx = max(dpH),
                                e.rel.m = mean(e.rel), e.rel.s = sd(e.rel), e.rel.mn = min(e.rel), e.rel.mx = max(e.rel),
                                red.m = mean(red), red.s = sd(red), red.mn = min(red), red.mx = max(red)))


# Ave and CL dose in same column for plot
x <- idat[, c('sample', 'animal', 'man.dm', 'month', 'rdose.kg.t')]
x$etype <- 'Average'
y <- idat[, c('sample', 'animal', 'man.dm', 'month', 'rdose.kg.t.ul')]
y$etype <- '90% CL'
names(y)[5] <- 'rdose.kg.t'
ulcomp <- rbind(x, y)

# Interpolate digestate pH to 6.6, roughly the pH of 25% red acidified slurry
x <- subset(titrat, animal == 'Afgasset')
target <- 6.6 # Target pH

idat.digpH <- as.data.frame(summarise(group_by(x, sample), 
                      rdose.kg.t = approx(pH, dose.kg.t, xout = target)$y,
                      rdpH = pH[dose.kg.t == 0] - target))
idat.digpH$pH <- target
idat.digpH <- rounddf(idat.digpH, func = signif, digits = 3)


