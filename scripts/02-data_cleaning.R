#### Preamble ####
# Purpose: Cleans the data
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
raw_GSS_data<-
  read_csv(
    "inputs/data/raw_GSS_data.csv",
    show_col_types = FALSE
  )

# Cleaning
cleaned_GSS_data <-
  clean_names(raw_GSS_data) |>
  drop_na(year, hlpoths, hlpsoc)

# Remove uncessary columns
cleaned_GSS_data <-
  subset(cleaned_GSS_data, select = c(year, age, sex, 
                                      abany, abpoor, abhlth, abrape))

# Keep years 2016, 2018, 2021, 2022
selected_years <- c("2016", "2018", "2021", "2022")
cleaned_GSS_data <- cleaned_GSS_data |>
  filter(year %in% selected_years)

# Rename columns to better understand
cleaned_GSS_data <- cleaned_GSS_data |>
  rename(
    any_reason = abany,
    low_income = abpoor,
    endangered_health = abhlth,
    rape = abrape
  )

# Rename sex responses
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(sex = recode(sex,
                 '1' = 'male',
                 '2' = 'female'))

# Rename variable responses
cleaned_GSS_data_renamed <-cleaned_GSS_data |>
  mutate(
    any_reason = recode(any_reason,
                        '1' = 'yes',
                        '2' = 'no'),
    low_income = recode(low_income,
                        '1' = 'yes',
                        '2' = 'no'),
    endangered_health = recode(endangered_health,
                               '1' = 'yes',
                               '2' = 'no'),
    rape = recode(rape,
                  '1' = 'yes',
                  '2' = 'no')
  )


#### Save data ####
write_csv(cleaned_GSS_data, "outputs/data/cleaned_GSS_data.csv")
