#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {

        model1 <- lm(Fertility ~ Agriculture, data = swiss)
        model2 <- lm(Fertility ~ Education, data = swiss)
        model3 <- lm(Fertility ~ Catholic, data = swiss)
        model1pred <- reactive({
            mpgInput <- input$sliderag
            predict(model1, newdata = data.frame(Agriculture = mpgInput))
        })
        model2pred <- reactive({
                mpgInput <- input$slidered
                predict(model2, newdata = data.frame(Education = mpgInput))
        })
        model3pred <- reactive({
                mpgInput <- input$slidercat
                predict(model3, newdata = data.frame(Catholic = mpgInput))
        })
        output$plot1 <- renderPlot({
            mpgInput <- input$sliderag
            plot(swiss$Agriculture,swiss$mpg,  xlab = "Agriculture", 
                 ylab = "Fertility", bty = "n", pch = 16,
                 xlim = c(0,100), ylim = c(0,100))
                abline(model1, col = "red", lwd = 2)
            points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred1 <- renderText({
            model1pred()
        })
        output$plot2 <- renderPlot({
                mpgInput <- input$slidered
                plot(swiss$Education,swiss$Fertility,  xlab = "Education", 
                     ylab = "Fertility", bty = "n", pch = 16,
                     xlim = c(1,60), ylim = c(0,100))
                abline(model2, col = "red", lwd = 2)
                points(mpgInput, model2pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred2 <- renderText({
                model2pred()
        })
        output$plot3 <- renderPlot({
                mpgInput <- input$slidercat
                plot(swiss$Catholic,swiss$Fertility,  xlab = "Catholic", 
                     ylab = "Fertility", bty = "n", pch = 16,
                     xlim = c(0,100), ylim = c(0,100))
                abline(model3, col = "red", lwd = 2)
                points(mpgInput, model3pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred3 <- renderText({
                model3pred()
        })
    })