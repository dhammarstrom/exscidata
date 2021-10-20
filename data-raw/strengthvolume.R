## code to prepare `strengthvolume` dataset goes here
library(tidyverse)

# load raw data
strengthtest <- readxl::read_excel("data-raw/strengthTests.xlsx", na = "NA", sheet = "oneRM") %>%
        filter(!is.na(leg), 
               exercise != "legcurl")



isokinetic <- readxl::read_excel("data-raw/strengthTests.xlsx", na = "NA", sheet = "Cybex") %>%
        filter(movement == "ext") %>%
        dplyr::select(subject, leg, exercise = velocity, timepoint, load) %>%
        print()





# load set/sex/include data
sets <- readr::read_csv2("data-raw/oneThreeSetLeg.csv")

strengthvolume <- bind_rows(strengthtest, isokinetic) %>%
        inner_join(sets %>%
                           pivot_longer(names_to = "sets", 
                                        values_to = "leg", 
                                        cols = multiple:single)) %>%
      #  filter(include == "incl") %>%
        dplyr::select(participant = subject,sex,  time = timepoint, sets, leg, exercise, load) %>%
        filter(participant != "FP10")



usethis::use_data(strengthvolume, overwrite = TRUE)
