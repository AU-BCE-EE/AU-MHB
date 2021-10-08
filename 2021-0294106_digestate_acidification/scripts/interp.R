# Interpolates to pH required for given 25% reductions

# Row-by-row, use digdat to get digestate pH needed for reductions
for (i in 1:nrow(datw)) {
  digd <- digdat[digdat$app.timing == datw[i, 'app.timing'], ]
  args(approx)
  datw[i, 'pHraw'] <- approx(digd$EF, digd$man.ph, xout = datw[i, 'rawred'])$y
  datw[i, 'pHdig'] <- approx(digd$EF, digd$man.ph, xout = datw[i, 'digred'])$y
}


