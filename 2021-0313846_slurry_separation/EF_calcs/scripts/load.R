fp <- '../inputs/inputs.xlsx'

dat <- as.data.frame(read_xlsx(fp, sheet = 1, skip = 0))
weather <- as.data.frame(read_xlsx(fp, sheet = 2, skip = 0))
sep <- as.data.frame(read_xlsx(fp, sheet = 3, skip = 0))
