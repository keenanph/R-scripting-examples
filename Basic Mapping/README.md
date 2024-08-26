# Basic Mapping with R

This folder contains an R script that demonstrates essential spatial data manipulation and visualization techniques using the `sf`, `spData`, `tidyverse`, and `units` libraries. The script provides a practical example of how to perform spatial operations such as projection transformations, buffering, intersections, and area calculations, along with visualization of the results.

## Files in This Folder

### 1. `Basic_Mapping.R`

This script demonstrates key techniques for working with spatial data in R:

#### What You Will Learn:

- **Loading Spatial Data**: How to load and work with spatial datasets provided by the `spData` package, including the world countries and U.S. states datasets.
- **Coordinate Reference Systems (CRS)**: How to check and transform the CRS of spatial data, particularly to the Albers Equal Area projection.
- **Spatial Filtering**: How to filter spatial data to focus on specific regions (e.g., Canada, New York).
- **Buffering**: How to create a buffer zone around spatial features (e.g., a 10 km buffer around Canada).
- **Spatial Intersection**: How to calculate the intersection between two spatial features (e.g., the intersection of New York State with the buffer around Canada).
- **Area Calculation**: How to calculate the area of a spatial feature (e.g., the area of the intersection) and convert it to square kilometers.
- **Visualization**: How to create and save visualizations of spatial data using `ggplot2` and `geom_sf`.

#### How to Run:

1. **Install Required Packages**: Ensure you have the following R packages installed:

   ```r
   install.packages(c("spData", "sf", "tidyverse", "units"))
   ```

2. Run the Script: Execute the Basic_Mapping.R script in R or RStudio. The script will perform the spatial operations and save two plots as PNG files in your working directory.

3. Examine the Output: The script generates and saves two plots:
        canada_buffer_plot.png: Shows a 10 km buffer zone around Canada.
        ny_border_plot.png: Highlights the intersection of New York State with the buffer around Canada.

4. View the Calculated Area: The script also calculates and prints the area of the intersection between New York State and the buffer zone in square kilometers.

**Learning Objectives**

By working through this script, you will:
    Understand the basics of working with spatial data in R using the sf package.
    Learn how to perform essential spatial operations like CRS transformation, buffering, and intersection.
    Gain experience in visualizing spatial data and saving plots for further analysis or presentation.
    Discover how to calculate areas of spatial features and interpret these in meaningful units (e.g., square kilometers).

How to Use
    Run the Script: Execute the script in your R environment to see how spatial data manipulation and visualization can be performed.
    Explore the Visualizations: Open the generated PNG files to see the results of the spatial operations visually.
    Adapt and Extend: Use the techniques demonstrated in this script to apply similar operations to your own spatial datasets.