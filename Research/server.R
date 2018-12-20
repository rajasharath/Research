#install.packages('shiny')
#install.packages('markdown')
#install.packages('curl')
#install.packages('httr')
#install.packages('RCurl')

library('shiny')
library(markdown)
library('curl')
library('httr')
library('RCurl')
library("RODBC")

source('D:\\R\\Research\\Research\\Research\\DBQueries\\SQL.R')
source('D:\\R\\Research\\Research\\Research\\DataSources\\pageContent.R')
db_conn = odbcConnect('WebCrawling')

function(input, output, session) {
    #----------------------------Urls------------------------------
    completeUrls <- getUrlsWithTypes()

    pipelineUrls <- subset(completeUrls, Name == "Pipeline")

    meetingUrls <- subset(completeUrls, Name == "Meetings")

    output$PipelineUrls = DT::renderDataTable({
    colnames(pipelineUrls)[1] <- "Url"
    colnames(pipelineUrls)[2] <- "Type"
    pipelineUrls
    })

    output$MeetingUrls = DT::renderDataTable({
    colnames(meetingUrls)[1] <- "Url"
    colnames(meetingUrls)[2] <- "Type"
    meetingUrls
    })

    #pipelineUrls <- getCompanyPipelineUrls(db_conn)

    #output$PipelineInfo = DT::renderDataTable({
    #pipelineUrls
    #})
    #-------------------Keywords-----------------------------
    keywords <- getSearchKeywordsFromDatabase()

    output$KeywordsInfo = DT::renderDataTable({
    colnames(keywords)[1] <- "Keyword"
    colnames(keywords)[2] <- "Synonyms"
    keywords
    })

    #----------------Headers of Urls------------------------
    headerOfUrls <- getPageModifiedDateOfUrlsFromDBUsingCurl()

    output$UrlsHeaderInfo = DT::renderDataTable({
                                                #print(headerOfUrls)
    #headerOfUrls$modifiedDate <- as.Date(headerOfUrls$modifiedDate, format = '%d%m%Y %H:%M:%S')
    headerOfUrls
    })

    observeEvent(input$button1, {
    r <- GET("https://www.excelra.com")
    OnPageInfo(as.character(headers(r)$date))
    })

    #output$OnPageInfo <- renderText({
    #df1 <- curl - I (input$urlInfo)
    #paste(df1)
    #})

    #-----------------Upload file-----------------------------
    output$contents <- renderTable({

        # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.

        req(input$file1)

        # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    tryCatch({
        df <- read.csv(input$file1$datapath,
                 header = input$header,
                 sep = input$sep,
                 quote = input$quote)
    },
      error = function(e) {
          # return a safeError if a parsing error occurs
          stop(safeError(e))
      }
    )

        if (input$disp == "head") {
        return(head(df))
    }
    else {
        return(df)
    }

    })

    #--------------------Plot---------------------------------
    output$plot <- renderPlot({
        plot(cars,type=input$plote)
    })

    #-------------------Summary-------------------------------
    output$summary <- renderPrint({
        summary(cars)
    })
}


