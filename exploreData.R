#csv_file <- 'acc_forward2.csv'
#csv_file <- 'acc_sitandup1.csv'
#csv_file <- 'acc_chairforward2.csv'
#csv_file <- 'acc_stairsdown2.csv'
#csv_file <- 'acc_stairsup1.csv'
csv_file <- 'prep_data/acc_leftrightfast2.csv'

data <- read.csv(csv_file)
head(data)

#id <- data$ID
#id <- data[, c("ID")]
#acc <- data[, c("X", "Y", "Z")]
#plot(data$ID, data$X, type="o", col="blue")

boxplot(data[, c("X", "Y", "Z")])