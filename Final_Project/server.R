#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(randomForest)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
server <- function(input, output) {
        
        # Define spending_score
        predict_score <- function(input1, input2, input3, input4, input5, input6) {
                # Load data and model
                cust_data <- read.csv("Customers.csv") # replace with your data file name
                cust_data$CustomerID = NULL
                model <- randomForest(Spending.Score..1.100. ~ ., data = cust_data)
                # Prepare input data for score
                new_data <- data.frame(Gender = input1, Age = input2, Annual.Income.... = input3, Profession = input4, Work.Experience = input5, Family.Size = input6)
                
                # Make prediction and return result
                prediction <- predict(model, new_data)
                return(prediction)
        }
        
        # Define action when "Score" button is clicked
        observeEvent(input$score, {
                # Get input values
                input1 <- input$gender
                input2 <- input$age
                input3 <- input$income
                input4 <- input$profession
                input5 <- input$exp
                input6 <- input$fsize
                
                # Call prediction function and output result
                output$spending_score <- renderText({
                        predict_score(input1, input2, input3, input4, input5, input6)
                })
                output$myplot <- renderPlot({
                        ggplot(cust_data, aes(x = Age, y = Spending.Score..1.100., color = Gender)) +
                                geom_point() + ggtitle("Age and Spending Score Distribution by Gender")
                        #plot(data = cust_data, x = cust_data$Age, y = cust_data$Spending.Score..1.100., colour = cust_data$Gender)
                }) 
        })
        
}

