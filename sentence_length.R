# Load necessary libraries
if (!require("dplyr")) install.packages("dplyr")
if (!require("stringr")) install.packages("stringr")
library(dplyr)
library(stringr)

# Function to split text into sentences and calculate sentence lengths
calculate_sentence_lengths <- function(text) {
  sentences <- unlist(str_split(text, "(?<=[.!?])\\s+", perl = TRUE))
  sapply(sentences, nchar)
}

# Example texts (Replace these with your actual texts)
undamaged_text <- "This is an example sentence from the undamaged text. It has several sentences. Each varies in length."
damaged_text_completed <- "This is a sentence from the completed text. It also varies. The lengths may differ from the original."

# Calculate sentence lengths for both texts
undamaged_sentence_lengths <- calculate_sentence_lengths(undamaged_text)
damaged_sentence_lengths <- calculate_sentence_lengths(damaged_text_completed)

# Statistical test (t-test) to compare sentence lengths
t_test_result <- t.test(undamaged_sentence_lengths, damaged_sentence_lengths)

# Display results
print(t_test_result)
