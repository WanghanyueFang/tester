#### Preamble ####
# Purpose: Downloads and saves the data from the opendatatoronto package.
# Author: Wanghanyue Fang
# Date: 27 September 2024
# Contact: sophia.fang@mail.utoronto.ca
# Pre-requisites:Install the opendatatoronto (Gelfand 2022) and tidyverse (Wickham et al. 2019) packages.


#### Workspace setup ####

install.packages("lintr")
library(lintr)
lint(filename = "/Users/fangwanghanyue/Desktop/STA304-Starter-Folder/Outputs/scripts")

install.packages("styler")
library(styler)
style_file(path = "/Users/fangwanghanyue/Desktop/STA304-Starter-Folder/Outputs/scripts")

library(opendatatoronto)
library(tidyverse)

#### Download data ####
raw_data <-
  search_packages("Apartment Building Evaluations") |>
  list_package_resources() |>
  filter(name == "apartment_building_evaluations_2023") |>
  get_resource()


#### Save data ####

# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "inputs/data/raw_data.csv") 

         
