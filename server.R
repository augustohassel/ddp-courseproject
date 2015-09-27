##Libraries 
library("shiny");library("quantmod");library("forecast");

shinyServer(
        function(input, output){
                
                dataInput <- reactive({
                        getSymbols(input$stock, 
                                   src = "yahoo",
                                   from = Sys.Date()-30,
                                   auto.assign = FALSE)
                })

                output$plot <- renderPlot({
                        model <- match.fun(input$model)(as.ts(dataInput()[,6]))
                        forecasting <- forecast(model, h = 5)
                        plot(forecasting)
                        legend("bottomleft", 
                               legend = c("Observed","Forecast"),
                               col = c("black", "blue"),
                               lty = c(1,1),
                               lwd = c(2,2),
                               horiz=F)
                        abline(v = length(dataInput()), col = "red")
                        title(sub = paste("Last Observed Point correspond to", index(tail(dataInput(), 1))))
                })
                
                output$o.model <- renderPrint(match.fun(input$model)(as.ts(dataInput()[,6])))
                
        }
        )