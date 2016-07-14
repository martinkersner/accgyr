# Martin Kersner, m.kersner@gmail.com
# 07/14/2016

library(dtw);

up <- read.table("up.csv", header = TRUE)
down <- read.table("down.csv", header = TRUE)
down[is.na(down)] <- 0

# UP base template, shouldn't be changed
base_start <- 30 # 30 for UP
base_step <- 110 # 110 for UP
up_base <- up[2, base_start:(base_start+base_step)] # them main base on which we will try to fit all others

# can be changed; expresses dataset that will be used for testing
data <- down
data_base <- up_base

# normalize
max_data <- max(data)
data_norm <- data/max_data
base_norm <- data_base/max_data

data <- data_norm
template <- base_norm

i <- 1 # index of testing signal 
distances <- c()
  
for (j in seq((ncol(data)-base_step))) {
  alignment <- dtw(data[i, j:(j+base_step)], template, window.type='sakoechiba', window.size=80, keep=TRUE)
  distances <- append(distances, alignment$distance)
}

dev.off()
par(mfrow=c(2,1))
ylim <- c(0, 1)
plot(seq(base_norm), base_norm)
plot(distances, ylim=ylim)

threshold <- 0.75 # decision threshold
abline(h=threshold, col='green')

if (max(distances) > threshold) {
  mtext("UP")
} else {
  mtext("DOWN")
}