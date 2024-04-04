#### Preamble ####
# Purpose: Simulates the change in responses for abortion from 2006 to 2016
# Author: Shirley Chen
# Date: 1 April, 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(janitor)

set.seed(250)

# 200 selected to represent total participants and years selected based on GSS data
#### Simulate data ####
simulated_data <-
  tibble(
    "Participant" = 1:200,
    Response = sample(
      x = c(1:5),
      size = 200,
      replace = TRUE
    ),
    # Randomly pick an option, with replacement, 200 times
    "Year" = sample(
      x = c("2006", "2016"),
      size = 200,
      replace = TRUE
    )
  )

# Clean the previously simulated data by creating a number of responses for "Important" and "Very Important"
#### Simulate cleaned data ####
simulated_data_clean <-
  tibble(
    "Year" = c(2006, 2016),
    "Yes" = sample(
      x = c(18:60),
      size = 2,
      replace = TRUE
    ),
    "No" = sample(
      x = c(25:80),
      size = 2,
      replace = TRUE
    )
  )

# Pivot and graph simulated data to create a connected dot graph
#### Graph simulated data ####
# Pivot simulated data
simulated_data_pivot <-
  simulated_data_clean |>
  pivot_longer(
    cols = c("Yes", "No"),
    names_to = "Response_Type",
    values_to = "Response_Proportion"
  )

# Graph data
simulated_data_pivot |>
  ggplot(mapping = aes(x = Year, y = Response_Proportion, fill = Response_Type)) +
  geom_line(color="grey") +
  geom_point(shape=21, color="black", fill="blue", size=3) +
  theme_minimal() +
  labs(x = "Year", y = "Proportion of Responses (%)", caption = "Data source: GSS.")



