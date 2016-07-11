# Martin Kersner, m.kersner@gmail.com
# 07/11/2016

# UP
data1  <- read.csv('prep_data/acc_up1.csv')
data2  <- read.csv('prep_data/acc_up2.csv')
data3  <- read.csv('prep_data/acc_up3.csv')
data4  <- read.csv('prep_data/acc_up4.csv')
data5  <- read.csv('prep_data/acc_up5.csv')
data6  <- read.csv('prep_data/acc_up6.csv')
data7  <- read.csv('prep_data/acc_up7.csv')
data8  <- read.csv('prep_data/acc_up8.csv')
data9  <- read.csv('prep_data/acc_up9.csv')
data10 <- read.csv('prep_data/acc_up10.csv')

# DOWN
# data1  <- read.csv('prep_data/acc_down1.csv')
# data2  <- read.csv('prep_data/acc_down2.csv')
# data3  <- read.csv('prep_data/acc_down3.csv')
# data4  <- read.csv('prep_data/acc_down4.csv')

window <- 50 # data contains about 50 measurements per second
ylim <- c(8.5, 10.5) # just to get a nice plot
xlim <- c(100, 150) # just to get a nice plot
crop_length <- (window/2) # length for cropping from the beginning and end of query signal

removeEdges <- function(data, crop_length) {
  id <- data$ID
  length_data <- length(id)
  return (id[crop_length:(length_data-crop_length)])
}

Z1  <- rollmean(data1$Z, k=window)
Z2  <- rollmean(data2$Z, k=window)
Z3  <- rollmean(data3$Z, k=window)
Z4  <- rollmean(data4$Z, k=window)
Z5  <- rollmean(data5$Z, k=window)
Z6  <- rollmean(data6$Z, k=window)
Z7  <- rollmean(data7$Z, k=window)
Z8  <- rollmean(data8$Z, k=window)
Z9  <- rollmean(data9$Z, k=window)
Z10 <- rollmean(data10$Z, k=window)

dev.off()
par(mfrow=c(4,1))
# plot(seq(length(Z1)), Z1, type="o", col="blue", ylim=ylim, xlim=xlim)
# plot(seq(length(Z2)), Z2, type="o", col="blue", ylim=ylim, xlim=xlim)
# plot(seq(length(Z3)), Z3, type="o", col="blue", ylim=ylim, xlim=xlim)
# plot(seq(length(Z4)), Z4, type="o", col="blue", ylim=ylim, xlim=xlim)

crossCorrMax<- function(a,b) {
  d <- ccf(a, b, plot = FALSE)
  cor = d$acf[,,1]
  lag = d$lag[,,1]
  res = data.frame(cor,lag)
  res_max = res[which.max(res$cor),]
  return(res_max)
} 

shift <- function(x, n, invert=FALSE, default=NA){
  stopifnot(length(x)>=n)
  if(n==0){
    return(x)
  }
  n <- ifelse(invert, n*(-1), n)
  if(n<0){
    n <- abs(n)
    forward=FALSE
  }else{
    forward=TRUE
  }
  if(forward){
    return(c(rep(default, n), x[seq_len(length(x)-n)]))
  }
  if(!forward){
    return(c(x[seq_len(length(x)-n)+n], rep(default, n)))
  }
}

###################
len <- length(Z1)
step <- 150

Z <- Z3
plot(seq(step), Z[1:150], type="o", col="blue", ylim=ylim, xlim=xlim)

cc <- crossCorrMax(Z[1:150], Z[151:300])
shiftZ1 <- shift(Z[151:300], cc$lag, default=0)
plot(seq(step), shiftZ1, type="o", col="blue", ylim=ylim, xlim=xlim)

cc <- crossCorrMax(Z[1:150], Z[301:450])
shiftZ2 <- shift(Z[301:450], cc$lag, default=0)
plot(seq(step), shiftZ2, type="o", col="blue", ylim=ylim, xlim=xlim)

Z_average <- (Z[1:150] + shiftZ1 + shiftZ2)/3

plot(seq(step), Z_average, type="o", col="red", ylim=ylim, xlim=xlim)

# for (i in seq(1, (len-(len%%step)), step)) {
#   plot(seq(step), Z1[i:(i+step-1)], type="o", col="blue", ylim=ylim, xlim=xlim)
# }