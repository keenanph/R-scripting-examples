# Load necessary libraries
# tidyverse: A collection of R packages for data manipulation and visualization
# knitr: A package for dynamic report generation in R
# kableExtra: Provides additional features for formatting tables created by knitr's kable function
# magick: A package for advanced image processing in R
# webshot2: Allows taking screenshots of web pages, including HTML outputs in R
library(tidyverse)
library(knitr)
library(kableExtra)
library(magick)
library(webshot2)

# URL of the CO2 data
# The data is retrieved from NOAA's FTP server, which provides historical CO2 concentration data
url <- 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_annmean_mlo.txt'

# Read in the CO2 data, skipping the appropriate number of lines to bypass metadata
# The data is read into a tibble with no column names initially
annual_mean <- read_table(url, skip = 45, col_names = FALSE)

# Manually set the correct column names for the dataset
# The columns represent the year, the mean CO2 concentration, and the uncertainty in the measurements
colnames(annual_mean) <- c("year", "mean", "uncertainty")

# Inspect the first few rows of the data to ensure it has been read and parsed correctly
print(head(annual_mean))

# Plot the annual mean CO2 concentration over time
# This line plot visualizes the change in CO2 levels at Mauna Loa over the years
ggplot(annual_mean, aes(year, mean)) +
  geom_line() +
  labs(title = "Annual Mean CO2 Concentration at Mauna Loa", x = "Year", y = "CO2 (ppm)")

# Extract the earliest decade of data for closer inspection
# This step selects the first 10 rows, which correspond to the earliest decade in the dataset
oldest_decade <- annual_mean %>%
  arrange(year) %>%
  slice(1:10)

# Save the table of the earliest decade as an HTML file
# The table is styled using kableExtra for better presentation
kable(oldest_decade, 'html') %>%
  kable_styling('striped') %>%
  save_kable("table.html")

# Use webshot2 to take a screenshot of the HTML table
# The screenshot is saved as a PNG file in the specified directory
webshot2::webshot("table.html", file = "C:/Users/<user>/Downloads/table.png", selector = "table")
