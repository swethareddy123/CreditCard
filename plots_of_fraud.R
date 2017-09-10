getwd()
data <- read.csv("creditcard.csv")


plot( Class~factor(Creditor),
      Creditcard,las = 1.95,
      xlab="creditor",ylab = "class",
      main = "Fraud Transaction per creditor",type = "l")

plot( Class~factor(Bank),Creditcard,
      las = 2,xlab="Bank",ylab = "class",
      main = "Fraud Transaction per Bank", type = "l")

plot( Class~factor(Creditcard$`Type Of Bank`),
      Creditcard,las = 2,
      xlab="Type of Bank",ylab = "class",
      main = "Fraud Transaction per Type of Bank")

