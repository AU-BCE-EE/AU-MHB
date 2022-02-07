fp <- '../inputs/inputs.xlsx'

type <- as.data.frame(read_xlsx(fp, sheet = 1, skip = 0))
pH <- as.data.frame(read_xlsx(fp, sheet = 2, skip = 0))
DM <- as.data.frame(read_xlsx(fp, sheet = 3, skip = 0))
weather <- as.data.frame(read_xlsx(fp, sheet = 4, skip = 0))
app <- as.data.frame(read_xlsx(fp, sheet = 5, skip = 0))
