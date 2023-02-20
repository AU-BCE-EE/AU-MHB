# Arcsine transformation from Zar (1999) p 278

arcsin <- function (x) {
  return(asin(sqrt(x)))
}

barcsin <- function (x) {
  return((sin(x)^2))
}
