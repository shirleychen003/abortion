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
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(religion = recode(religion,
                      '1' = 'Protestant',
                      '2' = 'Catholic',
                      '3' = 'Jewish',
                      '4' = 'None',
                      '5' = 'Other',
                      '6' = 'Buddhism',
                      '7' = 'Hinduism',
                      '8' = 'Other eastern religions', 
                      '9' = 'Muslim/Islam',
                      '10' = 'Orthodox-Christian',
                      '11' = 'Christian',
                      '12' = 'Native American',
                      '13' = 'Inter-nondenominational'))

# Rename sex responses
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(sex = recode(sex,
                      '1' = 'male',
                      '2' = 'female'))

# Rename variable responses
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(any_reason = recode(any_reason, 
                             '1' = 'yes', '2' = 'no'))
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(low_income = recode(low_income, 
                             '1' = 'yes', '2' = 'no'))
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(endangered_health = recode(endangered_health, 
                             '1' = 'yes', '2' = 'no'))
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(rape = recode(rape, '1' = 'yes', '2' = 'no'))
cleaned_GSS_data <-cleaned_GSS_data |>
  mutate(any_reason = recode(any_reason, 
                             '1' = 'yes', '2' = 'no'))


#### Save data ####
write_csv(cleaned_GSS_data, "outputs/data/cleaned_GSS_data.csv")
