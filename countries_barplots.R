data <- read.csv("creditcard.csv")
countries <- levels(data$Country)

#to known the country count

data <- read.csv("Creditcard.csv")  
level_country <- levels(data$Country)
count_country <- rep(0,length(level_country)) 
for(i in 1:length(level_country)) {
    for(j in 1:nrow(data)) {
        if(level_country[i] == data$Country[j]){
            count_country[i] = count_country[i] +1
        }
    }
}
count


#bargraph for no of transactions in countries

data_count <- table(data$Country)
barplot(data_count, xlab = "COuntries", 
        ylab = "No of transactions",
        main = "No of Transactions for each Country",
        names.arg = countries)



#bargraph for no of fraud transactions in countries

data_fraud <- subset(data, Class == 1)
data_fraud_count <- table(data_fraud$Country)
barplot(data_fraud_count, xlab = "Countries", 
        ylab = "No of fraud transactions",
        main = "No of Fraud Transactions for each Country",
        names.arg = countries)








