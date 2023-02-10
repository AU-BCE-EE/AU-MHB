# Univariate confidence interval from t.test()

confintt <- function(x, ...) {
  tt <- t.test(x, ...)
  ci <- tt$conf.int
  names(ci) <- c('lwr', 'upr')

  return(ci)
}
