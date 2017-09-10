install.packages("leaflet")
install.packages("ggmap")
library(leaflet)
library(ggmap)

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

#assigning colour to particular count of fraud transaction
getColor <- function(fraud_count_geo) {
  sapply(fraud_count_geo$count, function(count) {
    if(count == 0) {
      "lightgray"
    } else if(count == 1) {
      "blue"
    } else if(count == 2) {
      "green"
    } else if(count == 3) {
      "pink"
    } else if(count == 4) {
      "orange"
    } else if(count == 5) {
      "purple"
    } else if(count == 6) {
      "red"
    } else if(count == 7) {
      "lightred"
    } else {
      "cadetblue"
    } })
}

#designing icon
icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'white',
  library = 'ion',
  markerColor = getColor(fraud_count_geo)
)

#developing map and plotting countries with fraud count
data.frame(fraud_count_geo$Country, fraud_count_geo$count) %>% 
  leaflet() %>% 
  addProviderTiles('Stamen.Watercolor') %>% 
  addAwesomeMarkers(fraud_count_geo$lon, fraud_count_geo$lat, 
                    icon = icons,
                    popup = paste("Country: ", fraud_count_geo$Country, "<br>",
                             "Fraud Transactions:", fraud_count_geo$count)
                   #,clusterOptions = markerClusterOptions()
  )