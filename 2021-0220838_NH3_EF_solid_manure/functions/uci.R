# Univariate confidence interval 

uci <- function(x, alph = 0.05, ntails = 2, na.rm = TRUE, trans = NULL, backtrans = !is.null(trans)) {

  if (!ntails %in% 1:2) stop('ntails must be 1 or 2.')

  if (na.rm) x <- na.omit(x)

  x.orig <- x
  if (!is.null(trans)) {
    if (trans == 'asin') {
      ftf <- function(x) return(asin(sqrt(x)))
      btf <- function(x) return((sin(x)^2))
    } else if (trans == 'log10') {
      ftf <- log10
      btf <- function(x) 10^x
    } else if (trans == 'log') {
      ftf <- log
      btf <- function(x) exp(x)
    } else {
      stop('trans argument not recognized.')
    }
    x <- ftf(x)
  } else {
    ftf <- function(x) return(x)
    btf <- function(x) return(x)
  }

  s <- sd(x)
  n <- length(x)
  se <- s / sqrt(n)

  qq <- qt((1 - alph / ntails), df = n - 1)

  mn <- mean(x)

  ci <- mn + c(-1:1) * qq * se
  names(ci) <- c('lwr', 'mean', 'upr')

  # Back-transform and add un-transformed mean
  if (backtrans) {
    ci <- btf(ci)
    ci['mean.ut'] <- mean(x.orig)
  }

  return(ci)
}
