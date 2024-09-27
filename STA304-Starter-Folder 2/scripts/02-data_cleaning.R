#### Preamble ####
# Purpose: Cleans the raw Toronto Apartment building dataset obtained in "01-download_data.R".
# Author: Wanghanyue Fang
# Date: 27 September 2024
# Contact: sophia.fang@mail.utoronto.ca
# Pre-requisites: Run the file "01-download_data.R".

#### Workspace setup ####

install.packages("lintr")
library(lintr)
lint(filename = "/Users/fangwanghanyue/Desktop/STA304-Starter-Folder/Outputs/scripts")

install.packages("styler")
library(styler)
style_file(path = "/Users/fangwanghanyue/Desktop/STA304-Starter-Folder/Outputs/scripts")

library(tidyverse)

#### Loading the Raw Dataset ####

raw_data <- read_csv("inputs/data/raw_data.csv")

#### Cleaning the Dataset ####

cleaned_data <-
  raw_data |>
  
  # Selecting only the relevant columns
  select(`_id`, `YEAR REGISTERED`, `YEAR BUILT`, `PROPERTY TYPE`, `WARD`, 
         `CONFIRMED STOREYS`, `CLEANING LOG`, `VITAL SERVICE PLAN`, 
         `ELECTRICAL SAFETY PLAN`, `STATE OF GOOD REPAIR PLAN`, 
         `TENANT SERVICE REQUEST LOG`) |>
  
  # Renaming columns for clarity
  rename(`ID` = `_id`,
         `Year Registered` = `YEAR REGISTERED`,
         `Year Built` = `YEAR BUILT`,
         `Property Type` = `PROPERTY TYPE`,
         `Ward Number` = `WARD`,
         `Confirmed Storeys` = `CONFIRMED STOREYS`,
         `Cleaning Log` = `CLEANING LOG`,
         `Vital Service Plan` = `VITAL SERVICE PLAN`,
         `Electrical Safety Plan` = `ELECTRICAL SAFETY PLAN`,
         `Good Repair Plan` = `STATE OF GOOD REPAIR PLAN`,
         `Tenant Request Log` = `TENANT SERVICE REQUEST LOG`) |>
  
  # Mutating the Property Type for clarity
  mutate(`Property Type` = case_when(
    `Property Type` == "PRIVATE" ~ "Private Housing",
    `Property Type` == "TCHC" ~ "Toronto Community Housing",
    `Property Type` == "SOCIAL HOUSING" ~ "Social Housing",
    TRUE ~ `Property Type`
  )) |>
  
  # Ensuring storey numbers are within a realistic range
  filter(`Confirmed Storeys` >= 3 & `Confirmed Storeys` <= 30)

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

