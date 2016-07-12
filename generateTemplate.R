# Martin Kersner, m.kersner@gmail.com
# 07/11/2016

library("zoo")

# from stackoverflow
crossCorrMax<- function(a,b) {
  d <- ccf(a, b, plot = FALSE)
  cor = d$acf[,,1]
  lag = d$lag[,,1]
  res = data.frame(cor,lag)
  res_max = res[which.max(res$cor),]
  return(res_max)
}

# from stackoverflow
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
# data5  <- read.csv('prep_data/acc_down5.csv')
# data6  <- read.csv('prep_data/acc_down6.csv')
# data7  <- read.csv('prep_data/acc_down7.csv')
# data8  <- read.csv('prep_data/acc_down8.csv')
# data9  <- read.csv('prep_data/acc_down9.csv')
# data10  <- read.csv('prep_data/acc_down10.csv')

window <- 50 # data contains about 50 measurements per second

start <- 100
end   <- 400

Z1  <- rollmean(data1$Z, k=window)[start:end]
Z2  <- rollmean(data2$Z, k=window)[start:end]
Z3  <- rollmean(data3$Z, k=window)[start:end]
Z4  <- rollmean(data4$Z, k=window)[start:end]
Z5  <- rollmean(data5$Z, k=window)[start:end]
Z6  <- rollmean(data6$Z, k=window)[start:end]
Z7  <- rollmean(data7$Z, k=window)[start:end]
Z8  <- rollmean(data8$Z, k=window)[start:end]
Z9  <- rollmean(data9$Z, k=window)[start:end]
Z10 <- rollmean(data10$Z, k=window)[start:end]

Z <- rbind(Z1, Z2)
Z <- rbind(Z, Z3)
Z <- rbind(Z, Z4)
Z <- rbind(Z, Z5)
Z <- rbind(Z, Z6)
Z <- rbind(Z, Z7)
Z <- rbind(Z, Z8)
Z <- rbind(Z, Z9)
Z <- rbind(Z, Z10)

# Z2 for base UP
base_start <- 25 # 25 for UP
base_step <- 50 # 50 for UP
threshold <- 0.7 # cross correlation threshold for accepting
base <- Z2[base_start:(base_start+base_step)] # them main base on which we will try to fit all others
base_df <- base
plot(base)

for (i in seq(10)) {
  tmp_whole <- Z[i, ]
  len <- length(tmp)
  for (j in seq(1, (len-(len%%base_step)), base_step)) {
    tmp_part <- tmp_whole[j:(j+base_step)]
    
    ccm <- crossCorrMax(base, tmp_part)
    if (ccm$cor > threshold) {
      base_df <- rbind(base_df, shift(tmp_part, ccm$lag, default=0)) # empty spaces filled with 0
    }
  }
}

noncol_values <- which(base_df != 0, arr.ind = T)
agg_count_cols <- as.data.frame(table(used_col_values[,2]))
template <- colSums(base_df)/agg_count_cols[,2]
plot(template)