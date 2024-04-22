#### Preamble ####
# Purpose: Downloads and saves the data from the US General Social Survey
# Author: Shirley Chen
# Date: 1 April, 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: https://gssdataexplorer.norc.org/gss_data 
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(haven)
library(arrow)

#### Acquire data ####
converted_gss_data <- read_dta("inputs/data/GSS7218_R1.dta")

#### Save data as Parquet file ####
write_parquet(converted_gss_data, "inputs/data/raw_GSS_data.parquet")
