
rounddf <- function(x, digits = rep(2, ncol(x)), func = round) {

  # Convert data.table to data frame
  DT <- FALSE
  if (class(x)[1] == 'data.table') {
    x <- as.data.frame(x)
    if (requireNamespace('data.table', quietly = TRUE)) {
      DT <- TRUE
    }
  }

  if (length(digits) == 1) {
    digits <- rep(digits, ncol(x))
  } else if (length(digits) != ncol(x)) {
    digits <- c(digits, rep(digits[1], ncol(x) - length(digits)))
    warning('First value in digits repeated to match length.')
  }

  for(i in 1:ncol(x)) {
    if(class(x[, i, drop = TRUE])[1] == 'numeric') x[, i] <- func(x[, i], digits[i])
  }

  if (DT) {
    x <- data.table(x)
  }

  return(x)
}
