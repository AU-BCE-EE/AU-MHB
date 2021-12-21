# Drop ALFAM2 results (will get from ALFAM2)

d1 <- subset(d1, !grepl('ALFAM2', DatabaseId))
d2 <- subset(d2, !grepl('ALFAM2', DatabaseId))

d1$tan.app <- d1$ManureTAN * d1$ManureApplicRate
d1$e.rel.final <- d1$CumulatEmission / d1$tan.app
d1$e.rel.72 <- d1$NH3CumulEmission72h / d1$tan.app

d2$tan.app <- d2$ManureTAN * d2$ManureApplicRate
d2$e.rel.final <- d2$CumulatEmission / d2$tan.app
d2$e.rel.72 <- d2$NH3CumulEmission72h / d2$tan.app

d1 <- subset(d1, !is.na(e.rel.final) & ManureDM >= 10)
d2 <- subset(d2, !is.na(e.rel.final) & ManureDM >= 10)


