library(dplyr)
library(ggplot2)
library(ggmap)
library(htmlwidgets)
library(widgetframe)

library(htmltools)


library(tidyverse)
library(rnoaa)
library(xts)
library(dygraphs)

d=meteo_tidy_ghcnd("USW00014733",
                   date_min = "2016-01-01", 
                   var = c("TMAX"),
                   keep_flags=T) %>% 
  mutate(date=as.Date(date),
         tmax=as.numeric(tmax)/10) #Divide the tmax data by 10 to convert to degrees.

summary(d)
a <- xts(d$tmax, order.by = d$date)

dygraph(a,main = 'Daily Maximum Temperature in Buffalo, NY')%>%
  dyRangeSelector(dateWindow = c('2020-01-01','2020-10-31'))
  
  
PRCP=meteo_tidy_ghcnd("USW00014733",
                   date_min = "2016-01-01", 
                   var = c("PRCP"),
                   keep_flags=T) %>% 
  mutate(date=as.Date(date))  

PRCP_time <- xts(PRCP$prcp,order.by = d$date)
dygraph(PRCP_time)%>%
  dyRangeSelector(dateWindow = c('2020-01-01','2020-10-31'))

dy_graph <- list(dygraphs::dygraph(a,group ='temp_rain',main = 'Daily Maximum Temperature in Buffalo, NY')%>%dyRangeSelector(dateWindow = c('2020-01-01','2020-10-31')),
                 dygraphs::dygraph(PRCP_time, group="temp_rain", main="Percipitation")%>%dyRangeSelector(dateWindow = c('2020-01-01','2020-10-31')))
htmltools::browsable(htmltools::tagList(dy_graph)) #Prints both together and can be exported to a webpage
#### Works


temp <- dygraph(a,main = 'Daily Maximum Temperature in Buffalo, NY')%>%
  dyRangeSelector(dateWindow = c('2020-01-01','2020-10-31'))
prcp <- dygraph(PRCP_time)%>%
  dyRangeSelector(dateWindow = c('2020-01-01','2020-10-31'))

dy_list <- list(temp,prcp)

(dy_list) #prints sep



