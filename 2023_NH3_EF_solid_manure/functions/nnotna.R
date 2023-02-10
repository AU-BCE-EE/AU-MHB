# Like sum(!is.na()) but doesn't require anonymous function for use and can accept multiple arguments without an error

nnotna <- function(x, ...) {
  return(sum(!is.na(x)))
}
