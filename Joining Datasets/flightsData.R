# Load necessary libraries
# tidyverse: A collection of R packages for data manipulation and visualization, including dplyr, ggplot2, and others
# nycflights13: Provides flight data for all flights that departed from NYC in 2013, along with related datasets like airports, airlines, etc.
library(tidyverse)
library(nycflights13)

# Join the flights data with the airports data
# Perform a left join where 'dest' from the flights data is matched with 'faa' in the airports data
# This adds airport information (like name, latitude, longitude) to each flight's destination
flight_join <- flights %>%
  left_join(airports, c('dest' = 'faa'))

# Arrange the joined data in descending order of flight distance
# This sorts the flights so that the longest flights appear first
descending <- flight_join %>%
  arrange(desc(distance))

# Select the first row of the sorted data (the flight with the longest distance)
airport_sel <- slice(descending, 1)

# Reorder the columns for clarity
# We are only interested in the airport name, flight distance, and origin of the flight
col_order <- c('name', 'distance', 'origin')
airport <- airport_sel[, col_order]

# Print the selected columns to the console
# This displays the name of the destination airport, the distance of the flight, and the origin airport
print(airport)
