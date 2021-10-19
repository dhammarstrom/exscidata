## Code to prepare the ten vs thirty data set ##

tenthirty <- readxl::read_excel("./data-raw/ten_vs_thirty_complete.xlsx", 
                                na = "NA") %>%
        dplyr::select(participant = subject, 
                      time = timepoint, 
                      group:load)



usethis::use_data(tenthirty, overwrite = TRUE)
