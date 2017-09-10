install.packages("forecast")
library(forecast)

data <- read.csv("creditcard.csv")

#forecasting using STL + ETS 
ts_amount <- ts(data_fraud$total_amount)
forecast(ts_amount)
plot(forecast(ts_amount),
     xlab = "Time",
     ylab = "Amount")


#forecasting using  ETS
ts_amount <- ts(data_fraud$total_amount)
m_ets = ets(ts_amount)
f_ets = forecast(m_ets) 
plot(f_ets, xlab = "Time", ylab = "Amount")






#scatterplot3d
require(datasets)
data(data_fraud)
data_fraud[1:5]
require(scatterplot3d)
scatterplot3d(data_fraud[1:3])
scatterplot3d(data_fraud[3:5])





