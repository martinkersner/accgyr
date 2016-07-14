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

# select template and query
csv_template <- stairsup1
csv_query    <- stairsdown1

data_query    <- read.csv(csv_query)
data_template <- read.csv(csv_template)

# PARAMETERS
template_start  <- 70 # beginning of template
template_length <- 100 # value 50 equals to 1 second of recording
window <- 50 # window size used for denoising data 
ylim <- c(8.5, 10.5) # y-axis limitation just to get a nice plot
crop_length <- (window/2) # length for cropping from the beginning and end of query signal
step <- 5

# denoising data
Z_query    <- rollmean(data_query$Z, k=window)
Z_template <- rollmean(data_template$Z, k=window)

removeEdges <- function(data, crop_length) {
  id <- data$ID
  length_data <- length(id)
  return (id[crop_length:(length_data-crop_length)])
}

# cut incomplete edges of signal
ID_query    <- removeEdges(data_query, crop_length)
ID_template <- removeEdges(data_template, crop_length)

# create short template for visualization
Z_template_crop <- Z_template
Z_template_crop[0:template_start] <- 0
Z_template_crop[(template_start+template_length):length(Z_template_crop)] <- 0

# create template for comparing purposes
template <- Z_template[template_start:(template_start+template_length)]

# plot graphs
par(mfrow=c(4,1))
plot(ID_query, Z_query, type="o", col="red", ylim=ylim)
plot(ID_template, Z_template, type="o", col="green", ylim=ylim)
plot(ID_template, Z_template_crop, type="o", col="blue", ylim=ylim)

# classifying signal
# taking non-overlapping adjacent parts of signal and comparing it with template using DTW
comparisons <- c()
for (i in seq(0, length(Z_query)-template_length, step)) {
  tmp_query <- Z_query[i:(i+template_length)]
  alignment <- dtw(tmp_query, template, keep=TRUE)
  #print(alignment$distance)
  comparisons <- append(comparisons, alignment$distance)
}

plot(seq(length(comparisons)), comparisons, type="o", col="black")
