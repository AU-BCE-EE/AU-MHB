
library(ALFAM2)

ns <- 50
dat <- data.frame(id = 1:ns, ct = 168, man.dm = seq(0, 40, length.out = ns), tan.app = 100, app.rate.ni = 30)

pred <- alfam2(dat, time.name = 'ct', group = 'id', app.name = 'tan.app')
dat <- cbind(dat, pred[, -1:-3])

plot(er ~ man.dm, data = dat, type = 'l', ylim = c(0, 0.8))
abline(v = 15, lty = 2, col = 'gray45')
args(alfam2)
