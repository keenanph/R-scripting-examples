# Max Temperature Mapping with R

This folder contains an R script that demonstrates how to download, process, and visualize global climate data, specifically focusing on the annual maximum temperature for each country. The script uses various R packages for spatial data manipulation and visualization to create informative maps of climate data.

## Files in This Folder

### 1. `climateMapping.R`

This script downloads maximum temperature data from the WorldClim database, processes it to calculate the annual maximum temperature for each country, and visualizes the data on a global map.

#### What You Will Learn:

- **Downloading Climate Data:** How to use the `geodata` package to download high-resolution climate data, such as maximum temperature, from the WorldClim database.
- **Spatial Data Manipulation:** How to handle raster and vector spatial data using the `terra`, `sf`, and `spData` packages in R.
- **Filtering and Converting Spatial Data:** How to filter out specific regions (e.g., Antarctica) and convert spatial datasets for compatibility with various analysis tools.
- **Data Extraction and Aggregation:** How to extract and aggregate spatial data to calculate maximum temperature values for specific regions (e.g., countries).
- **Creating Climate Maps:** How to create and customize maps that visualize climate data, using color scales to represent different temperature ranges.
- **Saving Outputs:** How to save the generated map as a PNG file for further use in reports or presentations.

#### How to Run:

1. **Install Required Packages:** Ensure you have the following R packages installed:

   ```r
   install.packages(c("geodata", "terra", "sp", "spData", "tidyverse", "sf"))
   ```

2. Run the Script: Execute the climateMapping.R script in R or RStudio. The script will:
        Download global maximum temperature data.
        Process the data to calculate the annual maximum temperature for each country.
        Create a map that visualizes the temperature data.
        Save the map as a PNG file in the specified directory.

3. Examine the Output: The script will generate and save a map (climate_mapping_plot.png) that shows the annual maximum temperature for each country, using a color scale to represent temperature differences.

**Learning Objectives**
By working through this script, you will:
    Gain experience in working with global climate data, including downloading and processing large spatial datasets.
    Learn how to manipulate and visualize spatial data in R, using a variety of specialized packages.
    Understand how to create informative maps that can help in analyzing and presenting climate data.
    Discover how to extract specific data points from raster datasets and associate them with vector data, such as country boundaries.

**How to Use**
1. Run the Script: Execute the script in your R environment to see how global climate data can be processed and visualized.
2. Explore the Output: Review the generated map to understand how maximum temperatures vary across different countries.
3. Adapt and Reuse: Use the techniques demonstrated in this script to analyze other types of climate data or to create similar maps for different variables.