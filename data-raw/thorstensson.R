library(tidyverse)

dat <- read_csv("data-raw/thorstensson1977/points.csv")


thorstensson <- dat |>
  dplyr::select(id, group, ft_area_pct, peak_torque_pct_mvc) |>
  print()

usethis::use_data(thorstensson, overwrite = TRUE)
