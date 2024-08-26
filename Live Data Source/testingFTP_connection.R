# Load necessary libraries
library(tidyverse)

# Read the first few lines to inspect the structure
url <- 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_annmean_mlo.txt'
raw_data <- read_lines(url, n_max = 100)  # Adjust n_max to read more lines if necessary

# Print out the lines to inspect the structure
print(raw_data)
