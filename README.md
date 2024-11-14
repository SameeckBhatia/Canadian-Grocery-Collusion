# The Impact of Collusion and Promotions on Canadian Grocery Prices

## Overview

This study examines the pricing patterns in the Canadian grocery market, particularly focusing on the impact of promotions and price variations. Our findings indicate that while non-promotional prices have slightly decreased over a nine-month period, promotional pricing strategies continue to influence consumer costs.

## File Structure

The file structure for the repository and project is as follows:

- `data` contains all the required simulated, raw, and analysis data for the project.
- `other` contains rough sketches of the dataset and LLM chat history.
- `scripts` contains scripts for simulating and testing mock data, as well as cleaning raw data.
- `paper` contains all relevant files to the paper, references, and the Quarto document used to render it.

## LLM Usage
Aspects of the code were written with the help of the chatbot, ChatGPT. The testing script was written with the help of ChatGPT, and the entire chat history is available in `other/llm_usage/usage.txt.`

## Installation Instructions

To replicate the analysis and run the code in this repository, you'll need to install several R packages. You can install them directly from CRAN using the following commands in your R console:

```R
install.packages(c("tidyverse", "sqldf", "RSQLite", "testthat"))
```