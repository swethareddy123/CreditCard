
data <- read.csv("creditcard.csv")
class = data$Class
time = data$Time
plot(class ~ time,
     ylab = "no. of frauds",
     xlab = "time",
     main = " no of fraud transactions per second",
     type = "l")