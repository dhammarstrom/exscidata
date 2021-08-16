## code to prepare `cyclingstudy` dataset goes here


# Load packages
library(readxl); library(tidyverse)


cyclingstudy <- read_excel("./data-raw/cyclingStudy.xlsx", na = "NA")


usethis::use_data(cyclingstudy, overwrite = TRUE)


