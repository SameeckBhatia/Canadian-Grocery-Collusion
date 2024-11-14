#### Preamble ####
# Purpose: Cleans the raw data from a SQL database for analysis.
# Author: Sameeck Bhatia, Sean Chua, Cristina Su Lam, Mariko Lee, Karen Riani
# Date: 14 November 2024
# Contact: sameeck.bhatia@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
#   - The `tidyverse` package must be installed and loaded
#   - The `sqldf` package must be installed and loaded
#   - The `RSQLite` package must be installed and loaded
# Any other information needed? None

# Importing required libraries
library(sqldf)
library(tidyverse)
library(RSQLite)

# Connecting with the database
con <- dbConnect(SQLite(), "data/raw_data/raw_data.sqlite")

# Reading the raw data
RAW <- dbGetQuery(con, "SELECT * FROM RAW")

# Cleaning the data with a SQL query
cleaned_data <- sqldf("
  SELECT DATE(NOWTIME) AS DATE,
         OTHER, 
         AVG(CURRENT_PRICE) AS AVG_CURRENT_PRICE, 
         AVG(OLD_PRICE) AS AVG_OLD_PRICE
  FROM RAW
  GROUP BY DATE, OTHER
  HAVING CURRENT_PRICE IS NOT NULL
     AND OTHER = 'SALE'
     AND OLD_PRICE IS NOT NULL 
     AND OTHER IS NOT NULL
")

# Disconnecting from the database and exporting the cleaned data
dbDisconnect(con)

write_csv(cleaned_data, "data/analysis_data/cleaned_data.csv")
