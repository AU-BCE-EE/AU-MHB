# Make some ALFAM2 model predictions with default inputs

ns <- 50
pred <- data.frame(id = 1:ns, ct = 168, man.dm = seq(0, 40, length.out = ns), tan.app = 100, app.rate.ni = 30)

pred.th <- alfam2(pred, time.name = 'ct', group = 'id', app.name = 'tan.app')
pred.bc <- alfam2(pred, time.name = 'ct', group = 'id', app.name = 'tan.app', app.mthd.bc = 1)
pred.th$app.mthd <- 'bsth'
pred.bc$app.mthd <- 'bc'
pred <- rbind(cbind(pred, pred.th[, -1:-3]), cbind(pred, pred.bc[, -1:-3]))
