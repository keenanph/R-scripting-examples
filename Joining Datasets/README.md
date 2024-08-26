# Joining Datasets with R

This folder contains an R script that demonstrates how to join datasets using the `tidyverse` package, specifically focusing on flight data from the `nycflights13` package. The script provides a simple example of how to combine data from different sources, sort the combined data, and select specific columns for analysis.

## Files in This Folder

### 1. `flightsData.R`

This script joins flight data with airport data, sorts the flights by distance, and selects specific columns for further analysis.

#### What You Will Learn:

- **Data Joining with `dplyr`:** How to use the `left_join()` function to combine two datasets based on a common key, enriching one dataset with information from another.
- **Sorting Data:** How to sort data by a specific column in descending order using `arrange()`, allowing you to quickly identify extreme values (e.g., the longest flights).
- **Column Selection:** How to reorder and select specific columns from a dataset for focused analysis.
- **Working with Real-World Data:** The script uses real-world flight data from the `nycflights13` package, providing a practical example of data manipulation in R.

#### How to Run:

1. **Install Required Packages:** Ensure you have the following R packages installed:

   ```r
   install.packages(c("tidyverse", "nycflights13"))
   ```

2. Run the Script: Execute the flightsData.R script in R or RStudio. The script will join the flights and airports datasets, sort the resulting dataset by flight distance, and print the details of the longest flight.

3. Examine the Output: The script will print the name of the destination airport, the distance of the flight, and the origin airport for the longest flight from NYC in 2013.

**Learning Objectives**
By working through this script, you will:
    Gain experience in joining datasets using a common key with left_join().
    Learn how to sort datasets by specific columns, which is a common step in data analysis.
    Understand how to select and reorder columns for focused data analysis.
    See how these techniques can be applied to real-world data using the nycflights13 package.

How to Use
1. Run the Script: Execute the script in your R environment to see how data from different datasets can be combined and analyzed.
2. Explore the Output: Review the printed output to understand how the script identifies and displays the longest flight from NYC.
3. Adapt and Reuse: Use the techniques demonstrated in this script to join, sort, and analyze your own datasets.