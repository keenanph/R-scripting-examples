# Live Data Source with R

This folder contains an R script that demonstrates how to retrieve live data from an external source, process and visualize it, and then present the data in both HTML and image formats. The script connects to NOAA's FTP server to download historical CO2 concentration data and showcases how to work with live data streams in R.

## Files in This Folder

### 1. `Live_Data_Connection.R`

This script connects to a live data source, processes the retrieved data, and creates visual and tabular representations.

#### What You Will Learn:

- **Connecting to Live Data Sources:** How to connect to and retrieve data from an FTP server, specifically NOAA's repository of CO2 concentration data.
- **Data Parsing and Visualization:** How to parse and visualize the retrieved data, using a line plot to show trends in CO2 concentration over time.
- **Table Generation with `kableExtra`:** How to create and style HTML tables from the data, focusing on the earliest decade in the dataset.
- **Webpage Screenshot with `webshot2`:** How to take a screenshot of an HTML table and save it as an image file, making it easy to share or include in reports.

#### How to Run:

1. **Install Required Packages:** Ensure you have the following R packages installed:

   ```r
   install.packages(c("tidyverse", "knitr", "kableExtra", "magick", "webshot2"))
   ```
2. Run the Script: Execute the Live_Data_Connection.R script in R or RStudio. The script will:
        Download the latest CO2 data from NOAA.
        Parse and visualize the data with a line plot.
        Extract and display the earliest decade of data in an HTML table.
        Save a screenshot of the table as a PNG file.

3. Examine the Output: The script will generate:
        A line plot showing the trend in CO2 concentrations over time.
        An HTML table of the earliest decade of data, saved as table.html.
        A PNG screenshot of the table, saved in the specified directory.

**Learning Objectives**
By working through this script, you will:
    Learn how to connect to and retrieve live data from an external FTP server.
    Understand how to process and visualize time-series data in R.
    Gain experience in formatting and exporting data tables as both HTML and image files.
    Discover how to combine data processing, visualization, and presentation in a seamless workflow.

How to Use
1. Run the Script: Execute the script in your R environment to see how live data is retrieved, processed, and visualized.
2. Explore the Output: Review the generated plots and tables to understand how CO2 levels have changed over time.
3. Adapt and Reuse: Modify the script to connect to other live data sources or to apply similar techniques to your own datasets.