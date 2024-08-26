# Buffalo 20-Year Temperature Analysis

This R script is designed to analyze and visualize 20 years of temperature data for Buffalo, NY. The data is loaded from a CSV file, processed to calculate yearly mean temperatures, and then visualized in a time series plot.

## Requirements

Before running the script, ensure you have the following R packages installed:

- `tidyverse`: For data manipulation and visualization.
- `lubridate`: For working with date-time data.

You can install these packages by running:

```r
install.packages(c("tidyverse", "lubridate"))
```

Script Overview
1. Loading the Data

The script begins by loading the required libraries and the CSV file containing temperature data. The data is read into R, with missing values and unnecessary rows handled appropriately.
2. Data Cleaning and Transformation

The column names are renamed for clarity, and the 'time' column is converted to a Date type. Additional columns for year and month are extracted, and temperature values are converted to numeric types.
3. Filtering the Data

Data for the year 2024 is excluded from the analysis to focus on complete years only.
4. Calculating Yearly Mean Temperatures

The script groups the data by year and calculates the average mean temperature for each year.
5. Visualizing the Data

A time series plot is created to show the trend in yearly mean temperatures over time. A smooth curve is added to highlight the trend.
6. Saving the Plot

The generated plot is saved as a PNG file in the specified directory.
What You Can Learn from This Script

By exploring and running this script, you can learn several key R programming skills and data analysis techniques:

    Data Importation and Cleaning:
        Learn how to import data from a CSV file using read_csv().
        Understand how to handle missing data and skip unnecessary rows during import.
        Discover how to rename columns for clarity and consistency.

    Date Manipulation:
        Gain experience in converting string representations of dates into R's Date type.
        Learn to extract useful information like year and month from date objects using the lubridate package.

    Data Transformation with dplyr:
        Learn to use mutate() to create new columns or transform existing ones.
        Explore the use of across() to apply functions to multiple columns at once.
        See how to filter data with filter() based on specific conditions.

    Group-wise Summary Statistics:
        Understand how to group data by specific variables (e.g., year) using group_by().
        Learn to calculate summary statistics like the mean with summarise().

    Data Visualization with ggplot2:
        Discover how to create time series plots using ggplot() and geom_line().
        Learn to enhance visualizations with smooth curves using geom_smooth().
        Understand the use of labs() to add informative titles, subtitles, axis labels, and captions to your plots.

    Saving Plots:
        See how to save plots as image files using ggsave(), making your visualizations accessible outside of R.

    Real-World Data Application:
        This script uses real-world weather data, providing a practical example of how to apply R programming and data analysis techniques to real datasets.

How to Use

    Set the Path to the CSV File: Update the data_url variable in the script with the path to your CSV file.

    Run the Script: Execute the script in R or RStudio. The script will load the data, process it, and display a plot of the yearly mean temperatures.

    View the Plot: The plot will be displayed in your R plotting window. It will also be saved as Yearly_Mean_temp_Buffalo.png in your specified directory.

Output

    A PNG file (Yearly_Mean_temp_Buffalo.png) containing the plot of yearly mean temperatures in Buffalo, NY.