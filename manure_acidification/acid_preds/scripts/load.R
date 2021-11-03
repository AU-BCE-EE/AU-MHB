# 

wthr <- read.csv('../../../weather/output/means.csv')
titrat <- read.csv('../../../manure_titration/output/ave_titrat_interp_sample.csv')
dm <- as.data.frame(read_xlsx('../../DM/data/DM.xlsx', skip = 1))
