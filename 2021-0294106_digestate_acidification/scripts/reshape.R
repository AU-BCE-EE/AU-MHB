# Reshape

datw <- dcast(dat, app.timing ~ man.source, value.var = 'EF')
datw$raw <- (datw$cattle + datw$pig) / 2
datw$rawred <- 0.75 * datw$raw
datw$digred <- 0.75 * datw$digestate


