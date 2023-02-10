# Count obs and studies

# Counts
counts <- dat[, .(n.TAN.obs = nnotna(emis.perc.TAN), 
                  n.TAN.src = length(unique(source[!is.na(emis.perc.TAN)])), 
                  n.N.obs = nnotna(emis.perc.N),
                  n.N = length(unique(source[!is.na(emis.perc.N)]))), 
              by = c('manure.source', 'meas.meth')]
