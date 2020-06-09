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

        model1 <- lm(mpg ~ wt, data = mtcars)
        model2 <- lm(mpg ~ hp, data = mtcars)
        model3 <- lm(mpg ~ disp, data = mtcars)
        model1pred <- reactive({
            mpgInput <- input$sliderwt
            predict(model1, newdata = data.frame(wt = mpgInput))
        })
        model2pred <- reactive({
                mpgInput <- input$sliderhp
                predict(model2, newdata = data.frame(hp = mpgInput))
        })
        model3pred <- reactive({
                mpgInput <- input$sliderdisp
                predict(model3, newdata = data.frame(disp = mpgInput))
        })
        output$plot1 <- renderPlot({
            mpgInput <- input$sliderwt
            plot(mtcars$wt,mtcars$mpg,  xlab = "Weight", 
                 ylab = "Miles Per Gallon", bty = "n", pch = 16,
                 xlim = c(1,6), ylim = c(10,50))
                abline(model1, col = "red", lwd = 2)
            points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred1 <- renderText({
            model1pred()
        })
        output$plot2 <- renderPlot({
                mpgInput <- input$sliderhp
                plot(mtcars$hp,mtcars$mpg,  xlab = "power", 
                     ylab = "Miles Per Gallon", bty = "n", pch = 16,
                     xlim = c(100,400), ylim = c(10,50))
                abline(model2, col = "red", lwd = 2)
                points(mpgInput, model2pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred2 <- renderText({
                model2pred()
        })
        output$plot3 <- renderPlot({
                mpgInput <- input$sliderdisp
                plot(mtcars$disp,mtcars$mpg,  xlab = "displacement", 
                     ylab = "Miles Per Gallon", bty = "n", pch = 16,
                     xlim = c(50,500), ylim = c(10,50))
                abline(model3, col = "red", lwd = 2)
                points(mpgInput, model3pred(), col = "red", pch = 16, cex = 2)
        })
        output$pred3 <- renderText({
                model3pred()
        })
    })