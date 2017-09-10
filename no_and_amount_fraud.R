data <- read.csv("creditcard.csv")
data_fraud <- subset(data, Class == 1)

#no of fraud transactions
fraud_count = nrow(data_fraud)
fraud_count

#total fraud amount 
fraud_amount <- sum(data_fraud$Amount)
fraud_amount

#plot for fraud transactions
data$total_class <- cumsum(data$Class)
plot(data$total_class ~ data$Time, xlab = "Time",
     ylab = "Total fraud transactions",type = 'l',
     main = "Total fraud transactions")

#plot for fraud amount
data_fraud$total_amount <- cumsum(data_fraud$Amount)
plot(data_fraud$total_amount ~ data_fraud$Time,
     xlab = "Time", ylab = "Total Fraud Amount",type = "l",
     main = "Total Fraud Amount")
