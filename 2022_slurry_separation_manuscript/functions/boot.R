
boot <- function(x, fun = mean, n = 100, qs = c(0.025, 0.975)) {

  # Data frame of means
  d <- data.frame(id = 1:n, y = NA)

  for (i in 1:n) {
    # Take sample
    s <- sample(x, size = length(x), replace = TRUE)
    d[i, 'y'] <- fun(s)
  }

  # Calculate results
  qs = quantile(d$y, qs)
  names(qs) <- gsub('%', '', names(qs))
  res <- c(mean = mean(d$y), se = sd(d$y), qs = qs)

  return(res)

}
