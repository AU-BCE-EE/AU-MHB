# Capitalize first letter only
# Code from https://stackoverflow.com/questions/18509527/first-letter-to-upper-case, from contributor irJvV https://stackoverflow.com/users/3983004/irjvv

oneupper <- function(x) {
  x[!is.na(x)] <- paste0(toupper(substr(x, 1, 1)), substr(x, 2, nchar(x)))[!is.na(x)]
  return(x)
}
