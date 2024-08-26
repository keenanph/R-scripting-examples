# R Scripts for Data Analysis and Visualization

This folder contains a collection of R scripts designed to demonstrate various data analysis, manipulation, and visualization techniques. Each subfolder focuses on a specific topic or dataset, providing practical examples that can be adapted for a wide range of analytical tasks.

## Folder Structure and Contents

### 1. **average_plotting**
   - **Scripts:** `basicPlots.R`, `avgPlot_webBrowsingVersion.R`
   - **Focus:** Basic data visualization techniques using the `ggplot2` package, including creating histograms and scatter plots, and rendering plots in a web browser.

### 2. **Basic Mapping**
   - **Scripts:** `Basic_Mapping.R`
   - **Focus:** Spatial data manipulation and visualization using the `sf`, `spData`, and `terra` packages. The script demonstrates coordinate reference system (CRS) transformations, buffering, and intersection analysis.

### 3. **Dynamic Data with HTML**
   - **Scripts:** `Dynamic_Data_HTML.R`
   - **Focus:** Creating interactive data visualizations with `dygraphs`, `htmlwidgets`, and `htmltools`, specifically focusing on time-series data like temperature and precipitation.

### 4. **GDP Economics Plotting**
   - **Scripts:** `GDP_PerContinent.R`
   - **Focus:** Visualizing global economic data, particularly GDP per capita and life expectancy, using the `ggplot2` and `gapminder` packages. The script creates multi-faceted plots and examines economic trends over time.

### 5. **Joining Datasets**
   - **Scripts:** `flightsData.R`
   - **Focus:** Demonstrating data joining and manipulation techniques with the `tidyverse` package, specifically using flight and airport data from the `nycflights13` package.

### 6. **Live Data Source**
   - **Scripts:** `Live_Data_Connection.R`
   - **Focus:** Connecting to live data sources (e.g., NOAA FTP servers), processing time-series data, and creating both visual and tabular outputs using `tidyverse`, `kableExtra`, and `webshot2`.

### 7. **Max Temperature Mapping**
   - **Scripts:** `climateMapping.R`
   - **Focus:** Downloading and visualizing global maximum temperature data from WorldClim using `geodata` and related spatial data packages. The script highlights how to process and map climate data.

## How to Use

1. **Explore Each Folder:** Each subfolder contains a script and a specific example or use case. The scripts are well-commented, making them suitable for learning and adapting to your own projects.
2. **Run the Scripts:** Instructions are provided in each subfolder’s `README.md` for running the scripts. Ensure that you have the necessary R packages installed.
3. **Learn and Adapt:** These scripts are designed as instructional examples. You can learn from them or modify the code to suit your own data analysis and visualization needs.

## Requirements

Each script requires specific R packages to run. Please refer to the individual `README.md` files in each subfolder for a list of required packages and installation instructions.

## License

All scripts in this folder are provided under the MIT License. You are free to use, modify, and distribute them as you see fit.

## Acknowledgments

- Data sources used in these scripts include:
  - The `nycflights13` package for flight data.
  - The WorldClim database for global climate data.
  - The Gapminder dataset for global economic and health trends.
  - NOAA's Mauna Loa Observatory for CO2 concentration data.
- The scripts utilize a variety of R packages such as `tidyverse`, `ggplot2`, `sf`, `terra`, and others to demonstrate powerful data analysis and visualization techniques.

## Learning Objectives

By exploring the scripts in this folder, you will:

- Gain practical experience in data manipulation, visualization, and analysis using R.
- Learn how to work with different types of data, including spatial, time-series, and economic data.
- Understand how to create both static and interactive visualizations.
- Discover how to connect to live data sources and process real-time data.

This collection serves as a comprehensive resource for anyone looking to deepen their understanding of data analysis and visualization in R.
