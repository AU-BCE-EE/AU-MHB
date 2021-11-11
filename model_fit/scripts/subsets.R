

# Get micromet 

dse <- ds[!is.na(ds$e.24) &
          !is.na(ds$app.mthd) &
          !is.na(ds$man.dm) &
          !is.na(ds$man.source) & 
          !is.na(ds$air.temp.24) & 
          !is.na(ds$wind.2m.24) & 
          !is.na(ds$till) & 
          !is.na(ds$incorp) & 
          !is.na(ds$crop) & 
          !is.na(ds$man.ph) & 
          ds$e.24 > 0 & 
          ds$e.rel.24 < 1.0 &
          ds$man.source %in% c('cat', 'pig') &
          ds$man.dm <= 15 &
          ds$app.mthd != 'pi' &
          ds$app.mthd != 'cs' &
          ds$app.mthd != 'bss' &
          ds$meas.tech2 == 'micro met' &
          !ds$inst %in% c(102, 107, 108) & # Exclude AUN, old Swiss (IUL/FAT), and JTI
          ds$pmid != 1526 & # See rows 1703 and 1728 and others in MU data. Check with Marco
          ds$pmid != 1183 & # Closed slot negative emission
          !grepl('Exclude data from analysis', ds$notes)
          , ]

# These pmid will be retained (more trimming below)
pmid.keep <- dse$pmid

dde <- subset(d, pmid %in% pmid.keep)

