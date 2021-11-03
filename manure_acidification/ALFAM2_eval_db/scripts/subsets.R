# Acidification subset, excludes SDU

acid.exper <- unique(ds[ds$acid, c('inst', 'exper', 'exper.code')])
acid.exper.code <- acid.exper$exper.code
ds3 <- ds[!is.na(ds$e.24) & 
          !is.na(ds$app.mthd) & 
          !is.na(ds$incorp) & 
          !is.na(ds$crop) & 
          ds$e.24 > 0 & 
          ds$e.rel.24 < 2 &
          ds$man.dm <= 15 &
          ds$app.mthd != 'pi' &
          ds$app.mthd != 'cs' &
          ds$meas.tech2 != 'chamber' &
          ds$inst != 108 & 
          ds$inst != 102 &
          ###ds$inst != 211 &
          ds$app.mthd != 'os' &
          ds$exper.code %in%  acid.exper.code
         , ]

ds3 <- droplevels(ds3)
pmid.keep <- ds3$pmid

# 
d3 <- d[d$pmid %in% pmid.keep & d$ct >= 0, ]
#d3 <- d[d$pmid %in% pmid.keep & d$ct <= 73 & d$ct >= 0, ]

# Look for missing values
dfsumm(d3[, c('e.int', 'app.mthd', 'man.dm', 'man.source', 'air.temp', 
              'wind.2m', 'till', 'incorp', 'crop')])

# Fill in missing wind and temperature
d3$wind.2m[is.na(d3$wind.2m)] <- 2.7
d3$air.temp[is.na(d3$air.temp)] <- 13
