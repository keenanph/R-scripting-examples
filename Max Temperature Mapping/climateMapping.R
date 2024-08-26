# Install and load the geodata package
# geodata: A package for downloading and processing geographical data, such as climate and environmental data
install.packages("geodata")
library(geodata)

# Download the maximum temperature data (WorldClim v2.1)
# The data is downloaded at a resolution of 10 minutes (~18 km at the equator) and saved to the specified path
tmax_monthly <- worldclim_global(var = "tmax", res = 10, path = "C:/Users/<user>/Downloads/")

# Load necessary libraries for spatial data manipulation and visualization
# terra: For raster and vector data analysis
# sp: Provides classes and methods for spatial data manipulation
# spData: Provides spatial datasets used in examples and tests
# tidyverse: A collection of packages for data manipulation and visualization
# sf: For handling and analyzing simple features (vector data) in R
library(terra)
library(sp)
library(spData)
library(tidyverse)
library(sf)

# Load the 'world' dataset from the spData package
# This dataset contains polygons representing all the countries of the world
data(world)

# Prepare the world dataset by filtering out Antarctica
# Antarctica is often excluded from analyses due to its extreme and non-representative climate data
world2 <- world %>%
  filter(continent != 'Antarctica')

# Convert the filtered world dataset to an 'sf' object
# This conversion allows compatibility with the terra package for spatial operations
world2_sf <- st_as_sf(world2)

# Calculate the annual maximum temperature for each pixel in the downloaded raster data
# The max function is applied to the first layer of the tmax_monthly dataset, assuming it represents the relevant data
tmax_annual <- max(tmax_monthly[[1]])
names(tmax_annual) <- 'tmax'  # Rename the raster layer to 'tmax'

# Extract the maximum temperature for each country in the filtered world dataset
# This operation computes the maximum temperature value within each country's borders
Country_max <- terra::extract(tmax_annual, world2_sf, fun = max, na.rm = TRUE, exact = TRUE)

# Combine the extracted temperature data with the original world2_sf spatial data
# The resulting dataset includes both the country boundaries and the associated maximum temperatures
Country_max_sf <- cbind(world2_sf, Country_max)

# Plot the maximum temperature data on a world map
# The map uses a color scale (viridis) to represent the annual maximum temperature in each country
climate_plot <- ggplot() +
  geom_sf(data = Country_max_sf, aes(fill = tmax)) +
  scale_fill_viridis_c(name = "Annual\nMaximum\nTemperature (C)") + 
  theme(legend.position = 'bottom')

# Save the plot as a PNG file in the specified directory
ggsave("C:/Users/<user>/Downloads/climate_mapping_plot.png", climate_plot)

# Group the data by continent for potential further analysis
# This step prepares the data for summarizing or analyzing temperature patterns by continent
chart <- Country_max_sf %>%
  group_by(continent)

# The grouped data (chart) can be used for further operations, such as summarizing the maximum temperatures
