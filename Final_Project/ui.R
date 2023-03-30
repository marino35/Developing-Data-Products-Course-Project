#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(randomForest)
data <- read.csv("Customers.csv") 

# Define UI for application that draws a histogram
ui <- fluidPage(
        #data <- read.csv("Customers.csv"),
        titlePanel("Spending Score by Profession and Age"),
        sidebarLayout(
                sidebarPanel(
                        selectInput("gender", "Enter Gender", choices = sort(unique(data$Gender))),
                        #sliderInput("age", "Enter Age", value = 20, min = 20, max = 100),
                        numericInput("age", "Enter Age", value = NULL),
                        numericInput("income", "Enter Annual Income", value = NULL),
                        selectInput("profession", "Enter Profession", choices = sort(unique(data$Profession))),
                        selectInput("exp", "Enter Work Experience", choices = sort(unique(data$Family.Size))),
                        selectInput("fsize", "Enter Family Size", choices = sort(unique(data$Family.Size))),
                        actionButton("score", "See the Score")
                ),
                mainPanel(
                        h4("Spending Score:"),
                        verbatimTextOutput("spending_score")
                )
        )
)
