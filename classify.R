# Martin Kersner, m.kersner@gmail.com
# 07/14/2016

library(dtw);

up <- read.table("up.csv", header = TRUE)
down <- read.table("down_reduce.csv", header = TRUE)
#down <- down[-c(8, 10),]

# UP
base_start <- 25 # 25 for UP
base_step <- 50 # 50 for UP
up_base <- up[2,base_start:(base_start+base_step)] # them main base on which we will try to fit all others

data <- up
data_base <- up_base

# normalize
max_data <- max(data)
data_norm <- data/max_data
base_norm <- data_base/max_data

data <- data_norm
template <- base_norm

#for (i in seq(nrow(data))) {
for (i in 3) {
  comparisons <- c()
  
  for (j in seq((ncol(data)-base_step))) {
    #print(data[i, j:(j+base_step)])
    alignment <- dtw(data[i, j:(j+base_step)], template, keep=TRUE)
    comparisons <- append(comparisons, alignment$distance)
  }
}
plot(comparisons)