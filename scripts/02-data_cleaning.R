#### Preamble ####
# Purpose: Filters the necessary variables from the large converted dataset
# Author: Shirley Chen
# Date: 1 April 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# 00-simulate_data.R
# 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(knitr)
library(janitor)

# Open data
raw_GSS_data <-
  read_csv(
    "inputs/data/raw_GSS_data.csv",
    show_col_types = FALSE
  )

# Initial Cleaning
 filtered_GSS_data <-
  clean_names(raw_GSS_data) |>
  drop_na(year, age, relig, abany, abpoor, abhlth, abrape)

# Remove unnecessary columns
filtered_GSS_data <-
  subset(filtered_GSS_data, select = c(year, age, sex, relig,
                                      abany, abpoor, abhlth, abrape))

# Keep years 2010, 2014, 2018,
selected_years <- c("2010", "2014", "2018")
filtered_GSS_data <- filtered_GSS_data |>
  filter(year %in% selected_years)

#### Save data ####
write_csv(filtered_GSS_data, "outputs/data/filtered_GSS_data.csv")
