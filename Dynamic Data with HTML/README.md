# Dynamic Data with HTML

This folder contains an R script that demonstrates how to create interactive data visualizations using the `dygraphs`, `htmlwidgets`, `htmltools`, and other related libraries. The script focuses on working with weather data, specifically daily maximum temperature and precipitation, and rendering these visualizations as interactive HTML elements.

## Files in This Folder

### 1. `Dynamic_Data_HTML.R`

This script showcases how to retrieve, process, and visualize dynamic weather data using interactive web-based graphics.

#### What You Will Learn:

- **Data Retrieval with `rnoaa`:** How to fetch weather data from NOAA's Global Historical Climatology Network using the `rnoaa` package.
- **Time-Series Data Manipulation:** How to convert raw weather data into time-series objects with `xts` for further analysis and visualization.
- **Interactive Plotting with `dygraphs`:** How to create interactive, zoomable time-series plots that can be embedded in web pages or RMarkdown documents.
- **HTML Integration:** How to use `htmltools` to combine multiple interactive plots into a single HTML page for dynamic data exploration.

#### How to Run:

1. **Install Required Packages:**
   Make sure you have the following R packages installed:

   ```r
   install.packages(c("dplyr", "ggplot2", "ggmap", "htmlwidgets", "widgetframe", "htmltools", "tidyverse", "rnoaa", "xts", "dygraphs"))
   ```
2. Run the Script: Execute the Dynamic_Data_HTML.R script in R or RStudio. The script will download the necessary weather data, create interactive visualizations, and render them in your default web browser.

3. Explore the Visualizations: The script will generate interactive plots for:
        Daily maximum temperature in Buffalo, NY.
        Daily precipitation in Buffalo, NY.

4. These plots will include range selectors that allow you to zoom into specific date ranges for more detailed exploration.

5. Combine and View Plots: The script also demonstrates how to combine multiple interactive plots into a single HTML view, which can be exported and embedded into web pages.

**Learning Objectives**

By working through this script, you will:
    Gain experience in retrieving and processing real-world weather data.
    Learn how to work with time-series data in R and create interactive visualizations.
    Discover how to integrate interactive plots into web pages or reports, making your data analysis more dynamic and accessible.

How to Use
    Run the Script: Execute the script in your R environment to see how dynamic data visualizations are created and integrated with HTML.
    Explore the Output: Interact with the generated plots to explore the weather data dynamically. Adjust the date ranges and observe how the visualizations update in real time.
    Adapt and Reuse: Use the techniques demonstrated in this script to apply similar dynamic visualizations to your own datasets.