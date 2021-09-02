## code to prepare `dxadata` dataset goes here
library(tidyverse)

# load raw data
dxadata <- readr::read_csv2("data-raw/dxa_data.csv") 

# load set/sex/include data
sets <- readr::read_csv2("data-raw/oneThreeSetLeg.csv")

dxadata <- dxadata %>%
        inner_join(sets) %>%
        dplyr::select(participant = subject,time = timepoint, multiple:include, age:BMC.whole) %>%
        filter(participant != "FP10")



usethis::use_data(dxadata, overwrite = TRUE)
