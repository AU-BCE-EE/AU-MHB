

# Combined DM column
dat$DM <- ifelse(!is.na(dat$S.DM), dat$S.DM, dat$A.DM)
dat$exp.ID <- ifelse(!is.na(dat$S.exp.ID), dat$S.exp.ID, dat$A.exp.ID)
