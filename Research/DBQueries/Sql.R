#install.packages("RODBC")

library("RODBC")


#settings <- as.environment(list())

#settings$dbConnection <- 'Driver={SQL Server};Server=(HYD7ODC1171D);Database=WebCrawling;Trusted_Connection=yes;Uid=sa;Pwd=Srir@m123'

db_conn = odbcConnect('WebCrawling')

getDataBases <- function(db_conn) {
    sqlQuery(db_conn, "select name from master.sys.sysdatabases where dbid > 4")
}

getCompanyPipelineUrls <- function(db_conn) {
    data <- sqlQuery(db_conn, "SELECT [Id], [CompanyName], [PipelineUrl] FROM [WebCrawling] .[dbo] .[Company_PipelineUrl]")
    return(data)
}

#getCompanyPipelineUrls(db_conn)

setCompanyPipelineUrls <- function(db_conn, companyName, companyUrl) {
    query <- paste("insert into [WebCrawling].[dbo].[Company_PipelineUrl]([CompanyName],[PipelineUrl]) values ('", companyName, "','", companyUrl, "')")
    sqlQuery(db_conn,query)
}


#setCompanyPipelineUrls(db_conn, 'Novartis', 'https://www.novartis.com/our-science/novartis-global-pipeline')
#getCompanyPipelineUrls(db_conn)


getUrlsFromDatabase <- function() {
    query <- paste("SELECT [URLs_for_search__Company_websites_Conferences_],[Steps_leading_to_web_page] ,[Download_option]  FROM [WebCrawling].[dbo].[WebCrawl_Urls]")
    sqlQuery(db_conn, query)
}

getSearchKeywordsFromDatabase <- function() {
    query <- paste("SELECT [Keywords_used_for_search__globally_]
      ,[Examples]
  FROM [WebCrawling].[dbo].[WebCrawl_Keywords_Global]")
    sqlQuery(db_conn, query)
}
