# Predict emission with ALFAM2 model

pred <- ALFAM2mod(d3, pars = pars, time.name = 'ct', app.name = 'tan.app', group = 'pmid')

d3$e.rel.pred1 <- pred$er

# Add a new variable for ploting
d3$atreat <- factor(ifelse(d3$acid, 'Ubehandlet', 'Forsuret'))

# Get final times for plots
d3 <- as.data.frame(mutate(group_by(d3, pmid), ct.max = max(ct)))
d3 <- subset(d3,  !is.na(e.rel.pred1))
d3f <- subset(d3, ct == ct.max & !is.na(e.rel.pred1))

