# expand.grid analog that accepts (any number of) data frame (only) arguments
dfcombos <- function(...) {

  d <- list(...)
  
  i <- lapply(d, function(x) seq(nrow(x)))
  
  ind <- expand.grid(i)
  
  for (j in 1:length(d)) {
    if (j > 1) {
      res <- cbind(res, d[[j]][ind[, j], , drop = FALSE])
    } else {
      res <- d[[j]][ind[, j], , drop = FALSE]
    }
  }
  
  return(res)
}
