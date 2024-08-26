# GDP Economics Plotting

This folder contains an R script that demonstrates how to visualize economic data related to GDP per capita and life expectancy across different continents using the `ggplot2`, `gapminder`, and `dplyr` packages. The script focuses on creating insightful visualizations that illustrate global economic trends and disparities over time.

## Files in This Folder

### 1. `GDP_PerContinent.R`

This script creates and saves two key plots that analyze and visualize the relationship between GDP per capita, life expectancy, and population across different continents using the Gapminder dataset.

#### What You Will Learn:

- **Data Filtering and Transformation:** How to filter out specific countries (e.g., Kuwait) from the dataset and transform population data for easier interpretation in visualizations.
- **Creating Multi-Faceted Plots:** How to create plots that show data for different years or continents in separate facets, making it easier to compare trends over time or across regions.
- **Visualizing Economic Data:** How to create scatter plots and line plots that effectively communicate the relationship between life expectancy and GDP per capita, with point sizes representing population.
- **Weighted Averages:** How to calculate and plot weighted averages of GDP per capita by continent, offering a more nuanced view of economic trends.
- **Saving Plots:** How to save your plots as PNG files for use in reports, presentations, or further analysis.

#### How to Run:

1. **Install Required Packages:** Make sure you have the following R packages installed:

   ```r
   install.packages(c("ggplot2", "gapminder", "dplyr"))
   ```
2. Run the Script: Execute the GDP_PerContinent.R script in R or RStudio. The script will process the data and generate two key visualizations, which will be saved as PNG files in the specified output directory.

3. Examine the Output: The script will generate and save the following plots:
        Wealth_Life_exp.png: This plot visualizes the relationship between life expectancy and GDP per capita across different continents over time, with population size represented by point size.
        GDP_continent.png: This plot shows GDP per capita growth over time, highlighting both individual countries and the weighted average GDP per capita for each continent.

4. Explore Alternative Visualizations: The script includes commented-out code that offers alternative ways to visualize the data. You can uncomment and modify these lines to explore different visualization techniques.

**Learning Objectives**

By working through this script, you will:
    Gain experience in working with the Gapminder dataset, which is widely used for exploring global development trends.
    Learn how to create and customize complex plots using ggplot2.
    Understand how to calculate and visualize weighted averages in economic data.
    Discover how to save your visualizations as high-quality images for use in reports or presentations.

How to Use
    Run the Script: Execute the script in your R environment to generate the visualizations.
    Explore the Output: Open the saved PNG files to examine the visualizations. These plots can provide valuable insights into global economic and health trends.
    Adapt and Reuse: Modify the script to apply these visualization techniques to your own datasets or to explore different aspects of the Gapminder data.
