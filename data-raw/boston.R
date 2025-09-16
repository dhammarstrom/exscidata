# # Boston marathon results #
#
#
#
#
#

# These data are borrowed from https://github.com/adrian3/Boston-Marathon-Data-Project



library(tidyverse)


boston <- readRDS("data-raw/boston-results.RDS")

usethis::use_data(boston, overwrite = TRUE)
