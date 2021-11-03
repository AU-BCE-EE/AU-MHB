# 

wthr <- read.csv('../../../weather/output/weather_means.csv')
titrat <- read.csv('../../titration_analysis/output/ave_titrat_interp_sample.csv')
dm <- as.data.frame(read_xlsx('../../DM/data/DM.xlsx', skip = 1))
