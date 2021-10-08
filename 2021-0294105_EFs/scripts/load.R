fp <- '../inputs/inputs.xlsx'

comp <- as.data.frame(read_xlsx(fp, sheet = 1, skip = 0))
weather <- as.data.frame(read_xlsx(fp, sheet = 2, skip = 0))
app <- as.data.frame(read_xlsx(fp, sheet = 3, skip = 0))

comp$acid <- as.logical(comp$acid)
