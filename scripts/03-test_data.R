#### Preamble ####
# Purpose: Testing 02a-data_cleaning.R
# Author: Shirley Chen
# Date: 1 April 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download 02a-data_cleaning.R
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)

#### Test data ####
cleaned_GSS_data<-
  read_csv(
    "outputs/data/cleaned_GSS_data.csv",
    show_col_types = FALSE
  )


# Check for missing values in responses to abortion questions 
missing_values <- sum(is.na(cleaned_GSS_data$rape))
cat("Missing values in question_response:", missing_values, "\n")


# Check that abortion question responses are "yes" or "no"
class(cleaned_GSS_data$rape) == "character"
sum(!(unique(cleaned_GSS_data$rape) %in%
        c("yes",
          "no",
          NA))) == 0

class(cleaned_GSS_data$endangered_health) == "character"
sum(!(unique(cleaned_GSS_data$endangered_health) %in%
        c("yes",
          "no",
          NA))) == 0

class(cleaned_GSS_data$low_income) == "character"
sum(!(unique(cleaned_GSS_data$low_income) %in%
        c("yes",
          "no",
          NA))) == 0

class(cleaned_GSS_data$any_reason) == "character"
sum(!(unique(cleaned_GSS_data$any_reason) %in%
        c("yes",
          "no",
          NA))) == 0

# Check all the religion responses
class(cleaned_GSS_data$religion) == "character"
sum(!(unique(cleaned_GSS_data$religion) %in%
        c("Protestant",
        "Catholic",
        "Jewish",
        "None",
        "Other",
        "Buddhism",
        "Hinduism",
        "Other eastern religions",
        "Muslim/Islam",
        "Orthodox-Christian",
        "Christian",
        "Native American",
        "Inter-nondenominational",
          NA))) == 0



# Check that years are '2006' and '2016'
class(cleaned_GSS_data$year) == "numeric"
sum(!(unique(cleaned_GSS_data$year) %in%
        c("2006",
          "2016",
          NA))) == 0
