# Interpolate all titration curves to set of fixed kg/t dose

# Set dose levels, up to 30 kg/t
dose.levels <- 0:240 / 8

# Add levels from legislation, to later extract change in pH (some already present based on above, but for general approach, leave)
dose.levels <- unique(c(dose.levels, c(2.1, 2.9, 3.0, 11.0)))

idat <- data.frame()

for (x in split(dat, dat$id)) {
  ddll <- dose.levels[dose.levels < max(x$dose.kg.t, na.rm = TRUE)]
  y1 <- spline(x$dose.kg.t, x$pH, xout = ddll, method = 'hyman')$y
  y2 <- spline(x$dose.kg.t, x$buff.int, xout = ddll)$y
  dd <- data.frame(id = x$id[1], dose.kg.t = ddll, pH = y1, buff.int = y2)
  dd <- dd[!is.na(dd$pH), ]
  if (nrow(dd) == 0) stop('No rows, dropped complete titration sample during interpolation.')
  idat <- rbind(idat, dd)
}

idat <- merge(idat, setup[, -5], by = 'id')


