# Load necessary scripts
source("path/to/sentence_length.R")
source("path/to/n-grams.R")

# Initialize a counter for significant differences
significant_differences <- 0

# Check for significant difference in sentence lengths
if (t_test_result$p.value < 0.05) {
  significant_differences <- significant_differences + 1
}

# Check for significant difference in n-gram distribution
if (chi_squared_test$p.value < 0.05) {
  significant_differences <- significant_differences + 1
}

# Print warning based on the number of significant differences
if (significant_differences == 0) {
  print("Completion statistically consistent")
} else if (significant_differences == 1) {
  print("Warning! One value is off")
} else if (significant_differences == 2) {
  print("Warning! Two values are off")
}
