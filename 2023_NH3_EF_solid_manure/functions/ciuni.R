# Univariate confidence interval 

ciuni <- function(x, alph = 0.05, ntails = 2, na.rm = TRUE, trans = NULL, btrans = NULL) {

  if (!ntails %in% 1:2) stop('ntails must be 1 or 2.')

  if (na.rm) x <- na.omit(x)

  x.orig <- x
  if (!is.null(trans)) {
    x <- trans(x)
  }

  s <- sd(x)
  n <- length(x)
  se <- s / sqrt(n)

  qq <- qt((1 - alph / ntails), df = n - 1)

  mn <- mean(x)

  ci <- mn + c(-1:1) * qq * se
  names(ci) <- c('lwr', 'mean', 'upr')

  if (!is.null(btrans)) {
    ci <- btrans(ci)
    ci['mean.ut'] <- mean(x.orig)
  }

  return(ci)
}
