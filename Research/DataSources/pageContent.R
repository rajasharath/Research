#install.packages('libcurl')
#install.packages('curl')

library('curl')
#library('libcurl')
library(httr)
set_config(config(ssl_verifypeer = 0L))

source('D:\\R\\Research\\Research\\Research\\DBQueries\\SQL.R')


getPageHeaderUsingCurl <- function(urlInfo) {
    req <- curl_fetch_memory(urlInfo)
    str(req)
}

getPageModifiedDateUsingCurl <- function(urlInfo) {
    req <- curl_fetch_memory(url)
    modifiedDate <- req$modified #str(req$modified)
    statusCode <- req$status_code
    headerDataFrame <- data.frame(url, modifiedDate = unlist(modifiedDate), statusCode)
}


getPageModifiedDateOfUrlsFromDBUsingCurl <- function() {
    data <- data.frame()
    dbdata <- getUrlsFromDatabase()
    #print(dbdata$URLs_for_search__Company_websites_Conferences_)
    for (url in dbdata$URLs_for_search__Company_websites_Conferences_[1:10]) {
        req <- curl_fetch_memory(url)      
        modifiedDate <- req$modified #str(req$modified)
        statusCode <- req$status_code
        headerDataFrame <- data.frame(url, modifiedDate=unlist(modifiedDate),statusCode)
        data <- rbind(data, headerDataFrame)
    }
    return(data)  
}

#getPageModifiedDateOfUrlsFromDBUsingCurl()

#getPageHeaderUsingCurl('https://www.excelra.com')
#getPageModifiedDateUsingCurl('https://www.excelra.com')