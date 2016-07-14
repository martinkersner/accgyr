# Martin Kersner, m.kersner@gmail.com
# 07/10/2016

library(dtw);

# load data
sitandup1     <- 'prep_data/acc_sitandup1.csv'
sitandup2     <- 'prep_data/acc_sitandup2.csv'
stairsup1     <- 'prep_data/acc_stairsup1.csv'
stairsup2     <- 'prep_data/acc_stairsup2.csv'
stairsdown1   <- 'prep_data/acc_stairsdown1.csv'
stairsdown2   <- 'prep_data/acc_stairsdown2.csv'
chairforward1 <- 'prep_data/acc_chairforward1.csv'
chairforward2 <- 'prep_data/acc_chairforward2.csv'

# select query and template
csv_query    <- chairforward1
csv_template <- chairforward2

data_query    <- read.csv(csv_query)
data_template <- read.csv(csv_template)

window <- 50 # data contains about 50 measurements per second

# denoise data
Z_query    <- rollmean(data_query$Z, k=window, fill=c(0,0,0))
Z_template <- rollmean(data_template$Z, k=window, fill=c(0,0,0))

alignment <- dtw(Z_query, Z_template, keep=TRUE)

alignment$distance # contain distance between compared signals (the smaller number means that signals are more similar)
