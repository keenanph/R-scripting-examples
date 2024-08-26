# Load necessary libraries
# tidyverse: A collection of R packages for data manipulation and visualization
# lubridate: A package to work with date-time data in R
library(tidyverse)
library(lubridate)

# Define the path to your CSV file
# This is the file containing 20 years of temperature data for Buffalo, NY
data_url <- '20 Year Temperature Mean\\buffalo20yearTemps.csv'

# Load the data into R
# 'skip = 2' skips the first two rows (which might contain metadata or notes)
# 'na = c('999.90', 'NA')' specifies that '999.90' and 'NA' should be treated as missing values
temp <- read_csv(data_url, skip = 2, na = c('999.90', 'NA'))

# Rename the columns for better readability
# This step assigns more descriptive names to each column in the dataset
colnames(temp) <- c('time', 'weather_code', 'temperature_2m_max_F', 
                    'temperature_2m_min_F', 'temperature_2m_mean', 
                    'sunrise', 'sunset', 'precipitation_sum_inch', 
                    'wind_speed_10m_max_mph', 'wind_gusts_10m_max_mph')

# Convert the 'time' column to a Date type and other relevant columns to numeric
# This makes it easier to manipulate and analyze the data later on
temp <- temp %>%
  mutate(time = as.Date(time, format="%m/%d/%Y"),  # Convert 'time' to Date format
         year = year(time),                         # Extract the year from the 'time' column
         month = month(time),                       # Extract the month from the 'time' column
         across(starts_with('temperature_2m_'), as.numeric))  # Convert temperature columns to numeric

# Filter out data for the year 2024
# We are interested in data only up to the year 2023
temp_filtered <- temp %>%
  filter(year < 2024)

# Calculate the mean temperature for each year
# This step groups the data by year and calculates the average mean temperature for each year
yearly_temp <- temp_filtered %>%
  group_by(year) %>%
  summarise(yearly_mean_temp = mean(temperature_2m_mean, na.rm = TRUE))

# Create a plot to visualize the yearly mean temperature trend over time
# This plot shows how the average yearly temperature has changed over the past 20 years
plot <- ggplot(yearly_temp, aes(x = year, y = yearly_mean_temp)) +
  geom_line(group = 1) +                               # Plot a line connecting the yearly mean temperatures
  geom_smooth(color = 'red') +                         # Add a smooth curve to highlight the trend
  labs(title = 'Yearly Mean Temperatures in Buffalo, NY',  # Title of the plot
       subtitle = 'Data from the Buffalo 20-year weather dataset',  # Subtitle for context
       caption = 'Red line is a LOESS smooth',          # Caption explaining the red line
       x = 'Year',                                     # Label for the x-axis
       y = 'Mean Temperature (F)')                     # Label for the y-axis

# Display the plot in the RStudio viewer or your plotting window
print(plot)

# Save the plot as a PNG file in the specified directory
# The plot is saved so you can use it outside of R, like in presentations or reports
ggsave('20 Year Temperature Mean\\Yearly_Mean_temp_Buffalo.png', plot = plot)
