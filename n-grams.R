# Load necessary libraries
if (!require("text")) install.packages("text")
if (!require("quanteda")) install.packages("quanteda")
library(text)
library(quanteda)

# Function to extract and count n-grams
extract_ngrams <- function(text, n) {
  # Tokenize and create n-grams
  tokens <- tokens(text, what = "character")
  ngrams <- tokens_ngrams(tokens, n = n)

  # Count n-grams
  dfm(ngrams) %>%
    convert(to = "data.frame") %>%
    rowSums()
}

# Example texts (Replace these with the manuscipt's actual texts)
undamaged_text <- "This is an example sentence from the undamaged text. It has several sentences. Each varies in length."
damaged_text_completed <- "This is a sentence from the completed text. It also varies. The lengths may differ from the original."

# Extract and count bigrams (n = 3)
undamaged_trigrams <- extract_ngrams(undamaged_text, 3)
damaged_trigrams <- extract_ngrams(damaged_text_completed, 3)

# Compare bigram distributions using Chi-squared test
chi_squared_test <- chisq.test(rbind(undamaged_bigrams, damaged_bigrams))

# Display results
print(chi_squared_test)
