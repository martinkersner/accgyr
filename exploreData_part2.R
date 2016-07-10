# Martin Kersner, m.kersner@gmail.com
# 07/10/2016

sitandup1     <- 'prep_data/acc_sitandup1.csv'
sitandup2     <- 'prep_data/acc_sitandup2.csv'
stairsup1     <- 'prep_data/acc_stairsup1.csv'
stairsup2     <- 'prep_data/acc_stairsup2.csv'
stairsdown1   <- 'prep_data/acc_stairsdown1.csv'
stairsdown2   <- 'prep_data/acc_stairsdown2.csv'
chairforward1 <- 'prep_data/acc_chairforward1.csv'
chairforward2 <- 'prep_data/acc_chairforward2.csv'

# PARAMETERS
window <- 50 # data contains about 50 measurements per second
# make graphs look better and normalize it
#ylim   <- c(-0.1, 2.1)
ylim   <- c(-0.1, 600)
xlim   <- c(0, 400) 

cornerText <- function(text, location="topright") {
  legend(location, legend=text, bty ="n", pch=NA) 
}

plotY <- function(csv_file, window, ylim, xlim, title) {
  data <- read.csv(csv_file)
  Y <- rollmean(data$Y, k=window)
  ID <- data$ID
  crop_length <- window/2
  ID <- ID[crop_length:(length(ID)-crop_length)]

  cumsumY <- cumsum(Y)
  plot(seq(ID), cumsumY, ylim=ylim, xlim=xlim, main=title, col="blue")
  s <- seq(ID)
  lmres <- lm(cumsumY~s)
  abline(lmres, col="red")
  text <- trunc(lmres$coefficients["s"]*10^4)/10^4
  cornerText(text,location= "bottomright")
  
  #plot(seq(ID), Y, type="o", ylim=ylim, xlim=xlim, main=title)
  #abline(h=max(Y), col="red")
  #abline(h=min(Y), col="red")
  #abline(h=median(Y), col="green")
}

dev.off()
par(mfrow=c(2,2), oma=c(2, 0, 2, 0))
plotY(stairsup1, window, ylim, xlim, "up1")
plotY(stairsup2, window, ylim, xlim, "up2")
plotY(stairsdown1, window, ylim, xlim, "down1")
plotY(stairsdown2, window, ylim, xlim, "down2")

mtext("Y-axis (cummulative values) aka move forward while walking on stairs", outer = TRUE, cex = 1.5)