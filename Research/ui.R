library(shiny)
library(markdown)
library(DT)

shinyUI(navbarPage("Crawling",
tabPanel("Urls", sidebarLayout(
            sidebarPanel(
                        textInput("urlText", label = h3("Add Url"), value = ""),
                        selectInput("select", label = h3("Type"),
                            choices = list("Select Type"= 0,"Pipeline" = 1, "Meeting" = 2, "API" = 3),
                            selected = 0),
                        actionButton("addUrl", "Submit")
            ),
         #"Urls Manually Collected"
            mainPanel(
                      h1("Company Pipelines"),
                      DT::dataTableOutput("PipelineUrls"),
                      h1("Meetings"),
                      DT::dataTableOutput("MeetingUrls")
            )
)),
tabPanel("Keywords", sidebarLayout(
            sidebarPanel(
                        textInput("keywordText", label = h3("Add Keyword"), value = ""),
                        textInput("synonymsText", label = h3("Synonyms (Multiple entry with (,) separation"), value = ""),
                        actionButton("addKeyword", "Submit")
            ),
            mainPanel(
                       DT::dataTableOutput("KeywordsInfo")
            )
)),
tabPanel("Urls Header",
        sidebarLayout(
            sidebarPanel(
            textInput("urlInfo", label = h3("Check Page Modified Date"), value = "https://www.excelra.com"),
            actionButton("button1", "Submit")
            ),
            mainPanel(
                      textOutput("OnPageInfo"),
                      DT::dataTableOutput("UrlsHeaderInfo")
            )
)),
#tabPanel("Company Pipelines",
        #sidebarLayout(
            #sidebarPanel(
            #textInput("urlPipeline", label = h3("URL"), value = ""),
            #actionButton("pipelineButton", "Add Pipeline Url")
            #),
            #mainPanel(
                        #DT::dataTableOutput("PipelineInfo")
            #)
#)),
tabPanel("Uploading Files",

# Sidebar layout with input and output definitions ----
                sidebarLayout(

                # Sidebar panel for inputs ----
                sidebarPanel(

                # Input: Select a file ----
                fileInput("file1", "Choose CSV File",
                multiple = FALSE,
                accept = c("text/csv",
                         "text/comma-separated-values,text/plain",
                         ".csv")),

                         # Horizontal line ----
                tags$hr(),

                # Input: Checkbox if file has header ----
                checkboxInput("header", "Header", TRUE),

                # Input: Select separator ----
                radioButtons("sep", "Separator",
                   choices = c(Comma = ",",
                               Semicolon = ";",
                               Tab = "\t"),
                   selected = ","),

                   # Input: Select quotes ----
                radioButtons("quote", "Quote",
                   choices = c(None = "",
                               "Double Quote" = '"',
                               "Single Quote" = "'"),
                   selected = '"'),

                   # Horizontal line ----
                tags$hr(),

                # Input: Select number of rows to display ----
                radioButtons("disp", "Display",
                   choices = c(Head = "head",
                               All = "all"),
                   selected = "head")

                   ),

                   # Main panel for displaying outputs ----
                mainPanel(

                # Output: Data file ----
                tableOutput("contents")

                )

                )
                   ),

navbarMenu("More",
tabPanel("API's",
        sidebarLayout(
            sidebarPanel(
            textInput("urlAPIs", label = h3("URL"), value = ""),
            actionButton("apisInsertButton", "Add API")
            ),
            mainPanel(
                      textOutput("APIsInfo")
            )
)),
tabPanel("Plot",
        sidebarLayout(
            sidebarPanel(
                         radioButtons("plote", "Plot",
                                      c("Scatter" = "s", "Line" = "l", "Bar" = "b")
                                      )
            ),
            mainPanel(
                      plotOutput("plot"),
                      plotOutput("plot1"),
                      plotOutput("plot2")
            )
)),
tabPanel("Summary",
                   verbatimTextOutput("summary")
                   ),
         tabPanel("DataTable"),
         tabPanel("Description"),
         tabPanel("Clustering"),
         tabPanel("Regression")
         )
))