library(jsonlite)
library(httr)
library(rvest)

laquinta <- read_html("http://www.lq.com/en/findandbook/hotel-listings.html")


x <- GET("https://www.dennys.com/locations/")
