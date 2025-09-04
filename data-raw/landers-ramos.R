#
#
# Downloading and preparing data from Data for "Muscle thickness and 
# inflammation during a 50km ultramarathon in recreational runners" 
# 
# Complete reference:
# Landers-Ramos, Rian, 2022, "Data for "Muscle thickness and inflammation 
# during a 50km ultramarathon in recreational runners"", https://doi.org/10.7910/DVN/B6YPF0, Harvard Dataverse, V1 
# 
#
# @data{DVN/B6YPF0_2022,
# author = {Landers-Ramos, Rian},
# publisher = {Harvard Dataverse},
# title = {{Data for ``Muscle thickness and inflammation during a 50km ultramarathon in recreational runners''}},
# year = {2022},
# version = {V1},
# doi = {10.7910/DVN/B6YPF0},
# url = {https://doi.org/10.7910/DVN/B6YPF0}
# }
 
# Download files

# calcprotectin

download.file("https://dataverse.harvard.edu/api/access/datafile/6286226", destfile = "./data-raw/landers-ramos/calcprotectin.xlsx")
?download.file

readxl::read_excel("./data-raw/landers-ramos/calcprotectin.xlsx")
