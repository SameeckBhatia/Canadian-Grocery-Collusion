#### Preamble ####
# Purpose: Simulates a mock dataset of grocery stores and food prices.
# Author: Sameeck Bhatia, Sean Chua, Cristina Su Lam, Mariko Lee, Karen Riani
# Date: 14 November 2024
# Contact: sameeck.bhatia@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `tidyverse` package must be installed and loaded
# Any other information needed? None

# Importing required libraries
library(tidyverse)

# Setting a seed for reproducibility
set.seed(12)

n <- 100

# Defining vectors
date <- sample(seq(as.Date("2024-01-01"), as.Date("2024-11-13"), 1), n, replace = TRUE)
vendor <- sample(c("Loblaws", "Walmart", "T&T", "Sobeys"), n, replace = TRUE)
product <- sample(c("Apple", "Watermelon", "Celery", "Tomato"))
current_price <-  3 + abs(round(rnorm(n, 0, 2), 1)) - 0.01
previous_price <- 3 + abs(round(rnorm(n, 0, 2), 1)) - 0.01
transaction_type <- sample(c("Sale", "Promotion", "Rewards Points"), n, replace = TRUE)

# Creating the simulated dataset
simulated_data <- data.frame(
  date = date,
  vendor = vendor,
  product = product,
  current_price = current_price,
  previous_price = previous_price,
  transaction_type = transaction_type
)

# Exporting the data
write_csv(simulated_data, "data/simulated_data/simulated_data.csv")
