# Football injury data set.

library(tidyverse)

injury <- read_csv("data-raw/footballinjury/data.csv")


usethis::use_data(injury, overwrite = TRUE)
