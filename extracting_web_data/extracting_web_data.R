library(jsonlite)
library(httr)

x <- GET("google.com")
str(x)

x$headers
x$status_code
x$content

y <-GET("https://api.github.com/repos/hadley/dplyr/issues?per_page=3")

str(y)

url <- "https://httpbin.org/get"

httpbin_get <- GET(url)

http_status(httpbin_get$status_code)

headers <- httpbin_get$headers

content(httpbin_get)

json <- fromJSON("http://www.omdbapi.com/?t=frozen&y=&plot=short&r=json")
json_df <- as.data.frame(json)

planet <- fromJSON("http://swapi.co/api/planets/1/")
planet_df <- as.data.frame(planet)

GET("api.randomuser.me")

GET("api.openweathermap.org/data/2.5/forecast?id=524901")

url <- "http://api.randomuser.me/"
query <- "?results=5&gender=female"
person <- fromJSON(paste0(url,query))
person_df <- as.data.frame(person)

# This example shows you how to turn a JSON (and nested JSON) 
# response into a data.frame for further use in a R package


sample_response <- '{
"crust": "original",
"toppings": ["cheese", "potatoes", "garlic"],
"status": "cooking",
"customer": {
"name": "Garrett",
"phone": "573-111-1111"
}
}'

# Convert data from JSON to a list
raw_data <- fromJSON(sample_response, flatten = TRUE)
# Then unlist the list
raw_data_csv <- unlist(raw_data)
# Transpose it since we need from long to wide
raw_data_csv <- t(raw_data_csv)
# Now turn it into a data.frame
# Be sure to set stringsAsFactors = FALSE to avoid problems in the future
raw_data_csv <- data.frame(raw_data_csv, stringsAsFactors = FALSE)


#Frozen web scraping
library(rvest)
frozen_url <- "http://www.imdb.com/title/tt2294629/"
frozen_html <- read_html(frozen_url)
frozen_html
cast <- html_nodes(frozen_html, "span.itemprop")
html_text(cast)
