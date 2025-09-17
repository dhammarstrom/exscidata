# # Boston marathon results #
#
#
#
#
#

# These data are borrowed from https://github.com/adrian3/Boston-Marathon-Data-Project


## The full Boston marathon data set
library(tidyverse)


boston <- readRDS("data-raw/boston-results.RDS")

usethis::use_data(boston, overwrite = TRUE)


## Boston aggregated



boston_aggregated <- boston |> 
        filter(year >= 2000) |> 
        filter(age > 0) |> 
        mutate(age_group = cut(age, 
                               breaks = c(0, 18, 30, 40, 50, 60, Inf),
                               labels = c("Under 18", "18-29", "30-39", "40-49", "50-59", "60+"),
                               right = FALSE)) |> 
        filter(age_group != "Under 18") |> 
   
        slice_min(seconds, n = 100, 
                  by = c(gender, year, age_group)) |> 
        summarise(.by = c(gender, year, age_group), 
                  mean_seconds = mean(seconds),
                  sd_seconds = sd(seconds),
                  min_seconds = min(seconds), 
                  max_seconds = max(seconds),
                  n = n()) 
   
      
usethis::use_data(boston_aggregated, overwrite = TRUE)      

