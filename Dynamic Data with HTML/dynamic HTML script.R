# Load necessary libraries
# dplyr: A grammar of data manipulation, providing a consistent set of verbs to help you solve the most common data manipulation challenges.
# ggplot2: A system for declaratively creating graphics, based on The Grammar of Graphics.
# ggmap: Extends ggplot2 for creating spatial visualizations with maps.
# htmlwidgets: Enables HTML widgets to be embedded in various contexts, like RMarkdown documents or Shiny applications.
# widgetframe: A package to frame and embed HTML widgets in a webpage.
# htmltools: Provides tools for working with HTML content in R.
# tidyverse: A collection of R packages designed for data science.
# rnoaa: An R interface to many NOAA data sources.
# xts: Provides tools for working with time-series data.
# dygraphs: A package for creating interactive time-series plots.
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

# Retrieve and process NOAA weather data for Buffalo, NY
# meteo_tidy_ghcnd is used to fetch weather data from the NOAA Global Historical Climatology Network
# We are fetching daily maximum temperature (TMAX) data starting from January 1, 2016
d <- meteo_tidy_ghcnd("USW00014733",
                      date_min = "2016-01-01", 
                      var = c("TMAX"),
                      keep_flags = TRUE) %>% 
  mutate(date = as.Date(date),                   # Convert the date column to Date type
         tmax = as.numeric(tmax) / 10)           # Convert temperature data to degrees Celsius

# Summarize the data to get a quick overview of the TMAX values
summary(d)

# Convert the data to a time series object using the xts package
# This is required for creating interactive time-series plots with dygraphs
a <- xts(d$tmax, order.by = d$date)

# Create an interactive dygraph for daily maximum temperature in Buffalo, NY
# dyRangeSelector adds a range selector below the graph to allow users to zoom into specific date ranges
dygraph(a, main = 'Daily Maximum Temperature in Buffalo, NY') %>%
  dyRangeSelector(dateWindow = c('2020-01-01', '2020-10-31'))

# Retrieve and process daily precipitation (PRCP) data for the same period
PRCP <- meteo_tidy_ghcnd("USW00014733",
                         date_min = "2016-01-01", 
                         var = c("PRCP"),
                         keep_flags = TRUE) %>% 
  mutate(date = as.Date(date))  # Convert the date column to Date type

# Convert precipitation data to a time series object
PRCP_time <- xts(PRCP$prcp, order.by = d$date)

# Create an interactive dygraph for daily precipitation
dygraph(PRCP_time) %>%
  dyRangeSelector(dateWindow = c('2020-01-01', '2020-10-31'))

# Combine the temperature and precipitation graphs into a single HTML view
# This list contains two dygraphs that share the same range selector
dy_graph <- list(dygraphs::dygraph(a, group = 'temp_rain', main = 'Daily Maximum Temperature in Buffalo, NY') %>%
                   dyRangeSelector(dateWindow = c('2020-01-01', '2020-10-31')),
                 dygraphs::dygraph(PRCP_time, group = "temp_rain", main = "Precipitation") %>%
                   dyRangeSelector(dateWindow = c('2020-01-01', '2020-10-31')))

# Use htmltools to combine and render both dygraphs in a single HTML page
# browsable allows the dygraphs to be viewed together in an interactive format that can be exported to a webpage
htmltools::browsable(htmltools::tagList(dy_graph)) 

# Create individual dygraphs for temperature and precipitation
# These are similar to the previous ones but rendered separately
temp <- dygraph(a, main = 'Daily Maximum Temperature in Buffalo, NY') %>%
  dyRangeSelector(dateWindow = c('2020-01-01', '2020-10-31'))
prcp <- dygraph(PRCP_time) %>%
  dyRangeSelector(dateWindow = c('2020-01-01', '2020-10-31'))

# Create a list of the individual dygraphs
dy_list <- list(temp, prcp)

# Print the list of individual graphs separately
dy_list  # This prints each graph separately for easier examination in the console or browser
