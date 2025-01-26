
# Means and sd
dsumm <- rounddf(dsumm, func = signif, digits = 2)
fwrite(dsumm, '../output/group_summary.csv')
