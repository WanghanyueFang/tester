#### Preamble ####
# Purpose: Generates a simulated version of the Toronto apartment building evaluations dataset
# Author: Wanghanyue Fang
# Date: 27 September 2024
# Contact: sophia.fang@mail.utoronto.ca
# Pre-requisites: Install the janitor (Firke 2023) and tidyverse (Wickham et al. 2019) packages.


#### Workspace setup ###

#### Loading Packages ####

# install.packages("janitor")
# install.packages("tidyverse")
# install.packages("tibble")
library(janitor)
library(tidyverse)
library(tibble)

#### Data Simulation ####

set.seed(150)

# Simulating a dataset with 1000 apartment building evaluations
simulated_building_data <-
  tibble(
    # Simulating 1000 unique IDs for evaluations
    "ID" = 1:1000,
    
    # Simulating the year of registration between 2010 and 2023
    "YEAR REGISTERED" = sample(2010:2023, size = 1000, replace = TRUE),
    
    # Simulating the year the building was built, assuming older than the registration year
    "YEAR BUILT" = sample(1950:2020, size = 1000, replace = TRUE),
    
    # Simulating the year of evaluation
    "YEAR EVALUATED" = sample(2022:2024, size = 1000, replace = TRUE),
    
    # Simulating the property type
    "PROPERTY TYPE" = sample(
      x = c("PRIVATE", "TCHC", "SOCIAL HOUSING"),
      size = 1000,
      replace = TRUE),
    
    # Simulating the number of storeys (between 3 and 30 storeys)
    "CONFIRMED STOREYS" = sample(3:30, size = 1000, replace = TRUE),
    
    # Simulating the ward numbers (assumed to be between 1 and 25)
    "WARD" = sample(1:25, size = 1000, replace = TRUE),
    
    # Simulating the cleaning log, safety plans, and service request logs (scale of 1 to 3)
    "CLEANING LOG" = sample(1:3, size = 1000, replace = TRUE),
    "VITAL SERVICE PLAN" = sample(1:3, size = 1000, replace = TRUE),
    "ELECTRICAL SAFETY PLAN" = sample(1:3, size = 1000, replace = TRUE),
    "STATE OF GOOD REPAIR PLAN" = sample(1:3, size = 1000, replace = TRUE),
    "TENANT SERVICE REQUEST LOG" = sample(1:3, size = 1000, replace = TRUE)
  )

#### Testing the Simulated Dataset ####

# Checking the class of some of the columns
class(simulated_building_data$`PROPERTY TYPE`) == "character"
class(simulated_building_data$`YEAR BUILT`) == "numeric"
class(simulated_building_data$`CONFIRMED STOREYS`) == "integer"

# Checking that the minimum value in the ID column is at least 1
min(simulated_building_data$ID) >= 1

# Checking that the years built are earlier than the years registered
all(simulated_building_data$`YEAR BUILT` <= simulated_building_data$`YEAR REGISTERED`)

# Checking that the property types are correct
unique(simulated_building_data$`PROPERTY TYPE`) |> sort() == sort(c("PRIVATE", "TCHC", "SOCIAL HOUSING"))

# Checking that only the expected property types are present
length(unique(simulated_building_data$`PROPERTY TYPE`)) == 3

# Checking the valid range of storeys
range(simulated_building_data$`CONFIRMED STOREYS`) == c(3, 30)

