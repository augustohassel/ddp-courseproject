## Libraries
library("shiny");

shinyUI(
        fluidPage(
                ## Application Title
                titlePanel("Developing Data Products: Course Project by Augusto Hassel"),
                
                ## Sidebar Layout
                sidebarLayout(
                        sidebarPanel(
                                ## Title
                                h2("Select Stock and Model"),
                                
                                ## Select stock 
                                textInput(inputId = "stock",
                                          label = "Input Stock Ticker as stated on Yahoo Finance", 
                                          value = "AAPL"),
                                
                                ## Select Model to be used
                                selectInput("model", "Select the forecasting method to be applied:", 
                                            c("ARIMA" = "auto.arima", 
                                              "Exponential Smoothing" = "ets",
                                              "BATS" = "bats",
                                              "Neural Network" = "nnetar"), 
                                            multiple = F, 
                                            selected = "ARIMA"),
                                
                                submitButton("Process")
                        ),
                        mainPanel(
                                h1("Automatic Time Series Forecasting"),
                                h2("Theoretical explanation"),
                                p("This application has been created based on Hyndman and Khandakar work:",
                                  a("Automatic Time Series Forecasting: the Forecast package for R", href = "http://www.jstatsoft.org/article/view/v027i03", target = "_blank")),
                                h2("Results"),
                                p("This application makes a forecast for the next 5 periods on the selected stock, taking into account data of the last month."),
                                plotOutput("plot"), 
                                br(),        
                                verbatimTextOutput("o.model")
                        )
                )
        )
)