## code to prepare `dxadata` dataset goes here


download.file("https://www.dropbox.com/s/g2t97j8edqvvktn/tr003_dxa.csv?raw=1", 
              destfile = "data-raw/dxa_data.csv")

dxadata <- readr::read_csv("data-raw/dxa_data.csv")
