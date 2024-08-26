# Load necessary libraries
# ggplot2: A data visualization package based on The Grammar of Graphics
# gapminder: Provides the gapminder dataset, which includes country-level data on life expectancy, GDP per capita, and population
# dplyr: A package for data manipulation that provides a consistent set of verbs for common data manipulation tasks
library(ggplot2)
library(gapminder)
library(dplyr)

# Load the gapminder dataset
data("gapminder")

# Define the output directory for saving plots
# Change this path if you want to save the plots to a different location
output_dir <- 'C:\\Users\K<user>\\Downloads\\'

# Filter and transform the gapminder data
# Exclude Kuwait from the analysis due to its unique economic characteristics
# Convert population figures to units of 100,000 for better readability in the plots
gap_filter <- gapminder %>%
  filter(country != 'Kuwait') %>%
  mutate(pop = pop / 100000)

# Create the first plot: Life Expectancy vs. GDP per Capita over time
# This plot shows the relationship between life expectancy and GDP per capita across different continents
# Point size represents population, and the y-axis (GDP per capita) is scaled using a square root transformation
plot1 <- ggplot(gap_filter, aes(lifeExp, gdpPercap, color = continent, size = pop)) +
  geom_point() +
  scale_y_continuous(trans = 'sqrt') +  # Apply square root transformation to y-axis
  facet_wrap(~year, nrow = 1) +  # Create a separate plot for each year
  labs(title = 'Wealth and Life Expectancy through Time',
       x = 'Life Expectancy', y = 'GDP per Capita', size = 'Population',
       color = 'Continent') +
  theme_bw()  # Use a clean, white background theme

# Save the first plot as a PNG file
# The plot is saved in the specified output directory with a width of 15 inches
ggsave(paste0(output_dir, 'Wealth_Life_exp.png'), plot = plot1, width = 15, units = c('in'))

# Aggregate data by continent and year
# Calculate the weighted mean of GDP per capita, where the weights are the population sizes
# Summarize the total population for each continent and year
gapminder_continent <- gap_filter %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), pop = sum(as.numeric(pop)))

# Create the second plot: GDP per Capita Growth over Time
# This plot shows the GDP per capita for each country and continent over time
# The weighted mean GDP per capita for each continent is also shown, with point size representing population
plot2 <- ggplot() +
  geom_point(data = gap_filter, aes(x = year, y = gdpPercap, color = continent, group = country)) +
  geom_line(data = gap_filter, aes(x = year, y = gdpPercap, color = continent, group = country)) +
  geom_point(data = gapminder_continent, aes(x = year, y = gdpPercapweighted, size = pop)) +
  geom_line(data = gapminder_continent, aes(x = year, y = gdpPercapweighted)) +
  facet_wrap(~continent, nrow = 1) +
  theme_bw() +
  labs(title = 'GDP per Capita Growth over Time', x = 'Time', y = 'GDP per Capita',
       size = 'Population (100k)', color = 'Continent')

# Save the second plot as a PNG file
# The plot is saved in the specified output directory with a width of 15 inches
ggsave(paste0(output_dir, 'GDP_continent.png'), plot = plot2, width = 15, units = c('in'))

#########################################

# The commented code below is kept for reference or future use.
# It represents alternative approaches to plotting similar data.
# Uncomment and modify these lines if you want to explore different visualizations.

# ggplot(gap_filter,aes(x=year,y=gdpPercap,color=continent,group= country))+
#   geom_point()+geom_line()+
#   facet_wrap(~continent,nrow=1)+
#   geom_point(data=gapminder_continent,size= pop)
 
#   geom_line(data=gapminder_continent,aes(gdpPercapweighted))+
#   geom_point(data=gapminder_continent,aes(pop))+facet_wrap(~year,nrow=1)+
#   theme_bw()+labs()

# ggplot()+geom_line(gap_filter, aes(x=year,y=gdpPercap,color=continent))
# geom_point(gap_filter,aes(x=year,y=gdpPercap,color=continent))
# geom_line(gapminder_continent,aes(x=year))
# geom_point(gapminder_continent,aes(x,year,y,gdpPercapweighgt, size=pop/100000))
# ylim(0,50000)
