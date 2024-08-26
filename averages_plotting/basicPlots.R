# Load necessary libraries
# ggplot2: A powerful visualization package in R for creating a wide range of static and dynamic plots
library(ggplot2)

# Load the iris dataset
# The iris dataset is a classic dataset in R, commonly used for testing and demonstrating data analysis techniques
data(iris)

# Calculate the mean of Petal.Length
# Here, we calculate the average length of the petals across all iris samples
petal_length_mean <- mean(iris$Petal.Length)
print(petal_length_mean)  # Display the calculated mean in the console

# Create a histogram plot of Petal.Length
# A histogram is useful for visualizing the distribution of a single numerical variable
g <- ggplot(data = iris, aes(Petal.Length)) +
  geom_histogram()  # Create the histogram with the default binning

# Save the plot as a PNG file
# The plot is saved in the working directory (typically the Downloads folder) as 'iris_histogram.png'
ggsave("iris_histogram.png", plot = g)
