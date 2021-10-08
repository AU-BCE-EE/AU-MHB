# Load data

tit <- as.data.frame(read_xlsx('../data/titrations.xlsx', sheet = 1, skip = 1))
setup <- as.data.frame(read_xlsx('../data/titrations.xlsx', sheet = 2, skip = 1))
