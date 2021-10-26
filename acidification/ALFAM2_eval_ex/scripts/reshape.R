# Create a longish version

dat$cid <- 1:nrow(dat)

dl <- dat[, c(1:8, 13:14, 22:23, 27)]
dlt <- dlu <- dl
dlu$acidified <- FALSE
dlu$dose <- 0
dlt$acidified <- TRUE

# Extract untreated and acidified vars
eu <- dat[, grepl('\\.u$', names(dat))]
et <- dat[, grepl('\\.a$', names(dat))]

# Remove suffixes
names(eu) <- gsub('\\.u$', '', names(eu))
names(et) <- gsub('\\.a$', '', names(et))

# Add to other vars
dlu <- cbind(dlu, eu)
dlt <- cbind(dlt, et)
datl <- rbind(dlu, dlt)

# Calculate TAN app (kg/ha)
datl$tan.app <- datl$TAN * datl$man.app

# Unique obs name
datl$tid <- paste0(datl$cid, ifelse(datl$acidified, 'a', 'u'))
datl$acond <- ifelse(datl$acidified, 'a', 'u')
