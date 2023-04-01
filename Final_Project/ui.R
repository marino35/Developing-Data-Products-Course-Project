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
library(plotly)

cust_data <- read.csv("Customers.csv") 

# Define UI for application that draws a histogram
ui <- fluidPage(
        #data <- read.csv("Customers.csv"),
        titlePanel(HTML("<span style='color:red;font-weight:bold;'>Spending Score Prediction Based on Demographic Data </span>")),
        sidebarLayout(
                sidebarPanel(
                        selectInput("gender", "Enter Gender", choices = sort(unique(cust_data$Gender))),
                        #sliderInput("age", "Enter Age", value = 20, min = 20, max = 100),
                        numericInput("age", "Enter Age", value = NULL),
                        numericInput("income", "Enter Annual Income", value = NULL),
                        selectInput("profession", "Enter Profession", choices = sort(unique(cust_data$Profession))),
                        selectInput("exp", "Enter Work Experience", choices = sort(unique(cust_data$Family.Size))),
                        selectInput("fsize", "Enter Family Size", choices = sort(unique(cust_data$Family.Size))),
                        actionButton("score", "See the Score")
                ),
                mainPanel(
                        h3("Based on the selection a spending score will be predicted based on a model that is trained."),
                        h3(HTML("Dataset used to train this model can be found <a href = 'https://www.kaggle.com/datasets/datascientistanna/customers-dataset'>here.</a>")),
                        h3("Please wait around 5 seconds to see the spending score!"),
                        h3(HTML("<span style='color:blue;'>Spending Score is: </span>")),
                        verbatimTextOutput("spending_score"),
                        plotlyOutput("myplot")
                )
        )
)
