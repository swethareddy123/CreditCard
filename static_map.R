install.packages("ggmap")
install.packages("maptools")
install.packages("maps")

library(ggmap)
library(maptools)
library(maps)

data <- read.csv("cardcredit.csv")
data_fraud <- subset(data, Class == 1)
countries <- levels(data_fraud$Country)# list of all countries
xy.countries <- geocode(countries)# generates geo code lon and lat of countries
countries.x <- xy.countries$lon # assigning lon
countries.y <- xy.countries$lat # assigning lat
xy.countries # table with lon and lat

# tables the country and its count
countries_count <- aggregate(data$Class, 
                             by=list(Country=data$Country),
                             FUN=sum)
countries_count

#creating common column called country to merge with xy.countries table 
xy.countries$Country <- countries
xy.countries

#merging xy.countires and countries_count tables
fraud_count_geo <- merge(x = countries_count, y = xy.countries, 
                         by = "Country", all = TRUE)  
colnames(fraud_count_geo)[2] <- "count" #changing default country_count column name "x" to "count"
fraud_count_geo

#Using GGPLOT, plot the Base World Map
map <- NULL
mapWorld <- borders("world", colour="gray50", fill="light green") # create a layer of borders
map <- ggplot() +   mapWorld + xlab("longitude") + ylab("lattitude")
map
#Now Layer the cities on top
map <- map+ geom_point(data = fraud_count_geo, aes(x=countries.x, y=countries.y ,size = count),
                     colour="dark red",
                     fill ="red",
                     pch=21, alpha=I(0.7)) 
map

