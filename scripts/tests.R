#### Preamble ####
# Purpose: Tests the validity and size of the simulated dataset.
# Author: Sameeck Bhatia, Sean Chua, Cristina Su Lam, Mariko Lee, Karen Riani
# Date: 14 November 2024
# Contact: sameeck.bhatia@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `tidyverse` package must be installed and loaded
#   - The `testthat` packages must be installed and loaded
# Any other information needed? None

# Load required libraries
library(testthat)

# Importing the simulated data
simulated_data <- read_csv("data/simulated_data/simulated_data.csv")

# Test 1: Date Range
test_that("All dates are within the specified range", {
  expect_true(all(simulated_data$date >= as.Date("2024-01-01") &
                    simulated_data$date <= as.Date("2024-11-13")))
})

# Test 2: Vendor Values
test_that("Vendor values are limited to specified options", {
  expect_true(all(simulated_data$vendor %in% c("Loblaws", "Walmart", "T&T", "Sobeys")))
})

# Test 3: Product Values
test_that("Product values are limited to specified options", {
  expect_true(all(simulated_data$product %in% c("Apple", "Watermelon", "Celery", "Tomato")))
})

# Test 4: Transaction Type Values
test_that("Transaction type values are limited to specified options", {
  expect_true(all(simulated_data$transaction_type %in% c("Sale", "Promotion", "Rewards Points")))
})

# Test 5: Non-negative Prices
test_that("Current and previous prices are non-negative", {
  expect_true(all(simulated_data$current_price >= 0))
  expect_true(all(simulated_data$previous_price >= 0))
})

# Test 6: Price Difference Threshold
test_that("Current price is not unrealistically higher than previous price", {
  expect_true(all(simulated_data$current_price <= simulated_data$previous_price + 10))
})

# Test 7: No Missing Values
test_that("No missing values in any column", {
  expect_true(all(complete.cases(simulated_data)))
})

# Test 8: Row Count Consistency
test_that("The dataset contains exactly n rows", {
  expect_equal(nrow(simulated_data), 100)
})
