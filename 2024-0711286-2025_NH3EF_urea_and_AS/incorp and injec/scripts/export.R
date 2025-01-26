
# Export sumary
dsumm <- rounddf(dsumm, func = signif, digits = 2)
fwrite(dsumm, '../output/incorp_summary.csv')
