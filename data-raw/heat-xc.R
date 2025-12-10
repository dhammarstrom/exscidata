library(tidyverse)
library(readxl)


heatxc <- read_excel("data-raw/data-heat-xc.xlsx") |>
  rename(participant = "subject") |>
  print()


usethis::use_data(heatxc, overwrite = TRUE)
