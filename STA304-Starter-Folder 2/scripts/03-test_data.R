#### Preamble ####
# Purpose: Runs tests on the cleaned dataset to check the validity
# Author: Wanghanyue Fang
# Date: 27 September 2024
# Contact: sophia.fang@mail.utoronto.ca
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R".

#### Workspace setup ####

install.packages("lintr")
library(lintr)
lint(filename = "/Users/fangwanghanyue/Desktop/STA304-Starter-Folder/Outputs/scripts")

install.packages("styler")
library(styler)
style_file(path = "/Users/fangwanghanyue/Desktop/STA304-Starter-Folder/Outputs/scripts")

library(tidyverse)

#### Testing the Cleaned Dataset ####

# Loading the cleaned dataset
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

#### Running the tests on the cleaned dataset ####

# Checking the class of some of the columns

class(building_evaluations_cleaned_data$`Property Type`) == "character"
class(building_evaluations_cleaned_data$`Year Built`) == "numeric"
class(building_evaluations_cleaned_data$`Confirmed Storeys`) == "numeric"

# Checking that the minimum value in the ID column is at least 1
min(building_evaluations_cleaned_data$ID) >= 1

# Checking that the Property Types present are only 'Private Housing', 'Toronto Community Housing', and 'Social Housing'
unique(building_evaluations_cleaned_data$`Property Type`) |>
  sort() == sort(c("Private Housing", "Toronto Community Housing", "Social Housing"))

# Checking that there are exactly 3 property types present
length(unique(building_evaluations_cleaned_data$`Property Type`)) == 3

# Checking that the storey numbers are within the expected range (3 to 30)
range(building_evaluations_cleaned_data$`Confirmed Storeys`) == c(3, 30)

# Checking that all columns have no missing values
all(colSums(is.na(building_evaluations_cleaned_data)) == 0)