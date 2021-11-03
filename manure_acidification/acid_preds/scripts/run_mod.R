# Run ALFAM2 model

preds <- ALFAM2mod(dat, pars = pars, time.name = 'ct', app.name = 'tan.app', group = 'rid')

dat$e.rel <- 100 * preds$er

preds.ul <- ALFAM2mod(dat, pars = pars.ul, time.name = 'ct', app.name = 'tan.app', group = 'rid')

dat$e.rel.ul <- 100 * preds.ul$er
