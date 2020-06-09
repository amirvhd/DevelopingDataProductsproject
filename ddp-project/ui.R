#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
# you can use runGist() function as well.
# This app takae three input from user and gives back prediction (based on data in swiss dataset) for Standardized fertility measure on only the
# percent of males involved in agriculture, only percent education beyond primary school and only the percent of ‘catholic’.


library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Standardized fertility measure (based on swiss dataset)"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderag", "What is percent of males involved in agriculture as occupation?", 0, 100, value =60),
            sliderInput("slidered", "What is percent of education beyond primary school for draftees?", 1, 60, value = 20),
            sliderInput("slidercat", "What is the percent of ‘catholic’ ?", 0, 100, value = 50),
            submitButton("Submit") # New!
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Based on the agriculture", br(),plotOutput("plot1"),h3("Predicted fertility :"),textOutput("pred1")),
                        tabPanel("Based on the education", br(),plotOutput("plot2"),h3("Predicted fertility :"),textOutput("pred2")),
                        tabPanel("Based on the catholic", br(),plotOutput("plot3"),h3("Predicted fertility :"),textOutput("pred3"))
                        )
            
        )
    )
))