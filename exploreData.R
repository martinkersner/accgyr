# Martin Kersner, m.kersner@gmail.com
# 07/09/2016

# load data
#csv_file <- 'prep_data/acc_forward1.csv'
#csv_file <- 'prep_data/acc_forward2.csv'
csv_file <- 'prep_data/acc_sitandup1.csv'
#csv_file <- 'prep_data/acc_sitandup2.csv'
#csv_file <- 'prep_data/acc_stairsdown1.csv'
#csv_file <- 'prep_data/acc_stairsdown2.csv'
#csv_file <- 'prep_data/acc_chairforward1.csv'
#csv_file <- 'prep_data/acc_chairforward2.csv'

# PARAMETERS
window <- 50 # window size used for denoising data 
ylim <- c(-5,16)

data <- read.csv(csv_file)
head(data)

#X <- data$X
#Y <- data$Y
#Z <- data$Z

# denoise data
X <- rollmean(data$X, k=window, fill=c(0,0,0))
Y <- rollmean(data$Y, k=window, fill=c(0,0,0))
Z <- rollmean(data$Z, k=window, fill=c(0,0,0))

# plot denoised data
plot(data$ID, Z, type="o", col="blue", ylim=ylim)
lines(data$ID, X, type="o", col="red")
lines(data$ID, Y, type="o", col="green")
