
library(readxl); library(tidyverse)

millward <- read_excel("data-raw/millward1973.xlsx") %>%
        dplyr::select(group, RNA, protein_synthesis = proteinSynthesis) %>%
        print()


usethis::use_data(millward, overwrite = TRUE)



## Create a tibble by entering data
 millward2 <- tibble(diet = c(rep("Standard",4), 
                              rep("Protein free", 4), 
                              rep("Fasted", 2)),
                     group = c(rep("A", 4), rep("B", 6)),
                     treatment = c("Control", 
                                   "1 day refed",
                                   "2 days refed", 
                                   "3 days refed", 
                                   "1 day protein free", 
                                   "2 days protein free", 
                                   "10 days protein free",
                                   "21 days protein free",
                                   "Fasted 1 day",
                                   "Fasted 3 days"),
                     n = c(9,6,4,4,6,5,4,5,6,3), 
                     protein_synthesis = c(0.153, 
                                           0.070, 
                                           )
                              





