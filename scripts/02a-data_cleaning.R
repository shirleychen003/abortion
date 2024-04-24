#### Preamble ####
# Purpose: Cleans the filtered data
# Author: Shirley Chen
# Date: 1 April, 2024
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
cleaned_GSS_data <-
  read_csv(
    "outputs/data/filtered_GSS_data.csv",
    show_col_types = FALSE
  )


# Rename columns to better understand
cleaned_GSS_data <- cleaned_GSS_data |>
  rename(
    religion = relig,
    any_reason = abany,
    low_income = abpoor,
    endangered_health = abhlth,
    rape = abrape
  )

# Rename religion responses
cleaned_GSS_data <- cleaned_GSS_data |>
  mutate(religion = case_when(
    religion == 1 ~ 'Protestant',
    religion == 2 ~ 'Catholic',
    religion == 3 ~ 'Jewish',
    religion == 4 ~ 'None',
    religion == 5 ~ 'Other',
    religion == 6 ~ 'Buddhism',
    religion == 7 ~ 'Hinduism',
    religion == 8 ~ 'Other eastern religions',
    religion == 9 ~ 'Muslim/Islam',
    religion == 10 ~ 'Orthodox-Christian',
    religion == 11 ~ 'Christian',
    religion == 12 ~ 'Native American',
    religion == 13 ~ 'Inter-nondenominational',
    TRUE ~ as.character(religion)  
  ))

# Rename sex responses
cleaned_GSS_data <- cleaned_GSS_data |>
  mutate(sex = case_when(
    sex == 1 ~ 'male',
    sex == 2 ~ 'female',
    TRUE ~ as.character(sex)  
  ))

# Rename variable responses

cleaned_GSS_data <- cleaned_GSS_data |>
  mutate(any_reason = case_when(
    any_reason == 1 ~ 'yes',
    any_reason == 2 ~ 'no',
    TRUE ~ as.character(any_reason)
  ))

cleaned_GSS_data <- cleaned_GSS_data |>
  mutate(low_income = case_when(
    low_income == 1 ~ 'yes',
    low_income == 2 ~ 'no',
    TRUE ~ as.character(low_income)
  ))

cleaned_GSS_data <- cleaned_GSS_data |>
  mutate(endangered_health = case_when(
    endangered_health == 1 ~ 'yes',
    endangered_health == 2 ~ 'no',
    TRUE ~ as.character(endangered_health)
  ))

cleaned_GSS_data <- cleaned_GSS_data |>
  mutate(rape = case_when(
    rape == 1 ~ 'yes',
    rape == 2 ~ 'no',
    TRUE ~ as.character(rape)
  ))



#### Save data ####
write_csv(cleaned_GSS_data, "outputs/data/cleaned_GSS_data.csv")
