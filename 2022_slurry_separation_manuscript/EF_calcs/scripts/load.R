fp <- '../inputs/inputs.xlsx'

scenarios <- as.data.frame(read_xlsx(fp, sheet = 1, skip = 0))
comp <- as.data.frame(read_xlsx(fp, sheet = 2, skip = 0))
weather <- as.data.frame(read_xlsx(fp, sheet = 3, skip = 0))
stor <- as.data.frame(read_xlsx(fp, sheet = 4, skip = 0))
etime <- as.data.frame(read_xlsx(fp, sheet = 5, skip = 0))

# Separation performance for bootstrap approach
sep <- read.csv('../../lit_summary/output/sep_obs.csv')
