# Load necessary libraries
# spData: Provides spatial datasets for practicing spatial data analysis
# sf: Supports handling and analyzing spatial data using 'simple features'
# tidyverse: A collection of packages for data manipulation and visualization
# units: Allows handling physical measurement units in R
library(spData)
library(sf)
library(tidyverse)
library(units)

# Load the world and US states datasets from spData
# world: A spatial dataset containing polygons for all countries
# us_states: A spatial dataset containing polygons for all US states
data(world) 
data(us_states)

# Check the Coordinate Reference System (CRS) of the world data
# The CRS defines how the 3D earth is projected onto a 2D map
st_crs(world)

# Define the Albers Equal Area projection
# This projection is commonly used for maps of North America, minimizing distortion in area
albers <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

# Transform the world data to the Albers Equal Area projection
# Transforming the data ensures that spatial operations (like buffering and intersection) are accurate
world2 <- st_transform(world, albers)

# Filter the world data to focus only on Canada
# This step extracts the polygon corresponding to Canada from the world dataset
Canada <- world2 %>%
  filter(name_long == 'Canada')
  
# Create a 10 km buffer around Canada
# A buffer creates a zone around the features, in this case, a 10 km zone around Canada
Canada_buff_10 <- st_buffer(Canada, dist = 10000)

# Plot the buffered area around Canada
# This plot shows the 10 km buffer zone around Canada's borders
canada_plot <- ggplot(Canada_buff_10) + 
  geom_sf() +  # Use geom_sf to plot simple features objects
  ggtitle("10 km Buffer Around Canada") +  # Add a title to the plot
  theme_minimal()  # Apply a minimal theme for a clean look

# Save the plot to a PNG file
# The plot is saved as 'canada_buffer_plot.png' in your working directory
ggsave("canada_buffer_plot.png", canada_plot)

# Transform the US states data to the Albers projection
# This ensures that the US states data is in the same CRS as the world data, which is necessary for spatial operations
us_states2 <- st_transform(us_states, albers)

# Filter the US states data to focus only on New York
# This step extracts the polygon corresponding to New York from the US states dataset
New_York <- us_states2 %>%
  filter(NAME == 'New York')

# Calculate the intersection between the Canada buffer and New York
# The intersection function identifies the area where New York and the 10 km buffer around Canada overlap
border <- st_intersection(Canada_buff_10, New_York)

# Plot New York and the intersection area
# This plot highlights the area of New York that falls within 10 km of Canada's border
ny_border_plot <- ggplot() + 
  geom_sf(data = New_York) +  # Plot the New York state boundaries
  geom_sf(data = border, fill = 'red') +  # Highlight the intersection area in red
  ggtitle("Intersection of New York State with 10 km Buffer around Canada") +  # Add a title to the plot
  theme_minimal()  # Apply a minimal theme for a clean look

# Save the plot to a PNG file
# The plot is saved as 'ny_border_plot.png' in your working directory
ggsave("ny_border_plot.png", ny_border_plot)

# Calculate and display the area of the intersection
# The area is calculated in square meters and then converted to square kilometers for easier interpretation
total_area <- st_area(border)
total_area_km2 <- set_units(total_area, km^2)
print(total_area_km2)  # Print the calculated area in square kilometers
