# Load the httpgd library for web-based graphics output
# httpgd allows you to render and view plots directly in a web browser, which is useful for interactive data exploration
library(httpgd)
hgd()  # Start the HTTP graphics device

# Load the iris dataset
# The iris dataset is a built-in dataset in R, often used for demonstrating data analysis and visualization
data(iris)

# Load the ggplot2 library for plotting
# ggplot2 is a versatile package for creating high-quality plots in R
library(ggplot2)

# Create a scatter plot using ggplot2
# This scatter plot visualizes the relationship between Sepal.Length and Sepal.Width for each iris species
# The plot is automatically rendered in your web browser when using httpgd
print(
  ggplot(data = iris, aes(Sepal.Length, Sepal.Width)) +
    geom_point()  # Add points to the scatter plot
)
