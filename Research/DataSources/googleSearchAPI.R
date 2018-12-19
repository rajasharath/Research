library(httr)
library(stringr)
#query = "https://www.googleapis.com/customsearch/v1?key=API_KEY&cx=ENGINE_ID&q=SEARCH_TERM"
query ="https://www.googleapis.com/customsearch/v1?key=AIzaSyBtDRfEMEIeZfCTsSMhCWN509GL8NyHl7Y&cx=017576662512468239146:omuauf_lfve&q="

#take keywords from excel and search the google

getSearchResultOfKeyword <- function(keywords) {
    query <- paste(query,keywords,sep = "")
    print(query)
    content(GET(query))
}

getSearchResultOfKeyword('Rituxan')