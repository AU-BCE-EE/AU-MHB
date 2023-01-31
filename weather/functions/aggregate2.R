# Version of aggregate function that accepts multiple FUN functions
# Note that FUN is a named list of functions

# Example
#dat <- data.frame(grp = rep(1:3, each = 3), a = rnorm(9), b = runif(9))
#dat
#aggregate2(dat, x = c('a', 'b'), by = 'grp', FUN = list(mean = mean, sd = sd, n = length))

aggregate2 <- function(dat, x, by, FUN, ...) {

  for (i in 1:length(FUN)) {
    d <- aggregate(x = dat[, x, drop = FALSE], by = dat[, by, drop = FALSE], FUN = FUN[[i]], ...) 
    names(d)[!names(d) %in% by] <- paste0(names(d)[!names(d) %in% by], '.', names(FUN)[[i]])
    if (i == 1) {
      res <- d
    } else {
      res <- cbind(res, d[, !names(d) %in% by, drop = FALSE])
    }
  }

  return(res)

}
