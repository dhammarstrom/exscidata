## Goldberg 1968 ##


library(digitize)
library(tidyverse)


goldberg1968 <- digitize("data-raw/img/goldberg1968.png") 


# Fixed faulty point
goldberg1968 <- goldberg1968[1:42,]


goldberg1968_raw <- goldberg1968 %>%
        mutate(muscle = c(rep("plantaris", 19), rep("soleus", 23))) %>%
        rename(muscle.ww = x, 
               leucin.incorp = y) %>%
        
        
        print()

saveRDS(goldberg1968_raw, "data-raw/goldberg1968")

goldberg <- readRDS("data-raw/goldberg1968")

usethis::use_data(goldberg, overwrite = TRUE)

