#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
# you can use runGist() function as well.
# This app takae three input from user and gives back prediction for how many Miles per galon can go based on the
# only weight of the car, only power and only the displacement of the car.


library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict MPG"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderwt", "What is the weight of the car?", 1, 5.5, value = 2),
            sliderInput("sliderhp", "What is the power of the car?", 100, 300, value = 180),
            sliderInput("sliderdisp", "What is the displacement of the car?", 50, 500, value = 200),
            submitButton("Submit") # New!
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Based on the weight", br(),plotOutput("plot1"),h3("Predicted MPG :"),textOutput("pred1")),
                        tabPanel("Based on the power", br(),plotOutput("plot2"),h3("Predicted MPG :"),textOutput("pred2")),
                        tabPanel("Based on the displacement", br(),plotOutput("plot3"),h3("Predicted MPG :"),textOutput("pred3"))
                        )
            
        )
    )
))