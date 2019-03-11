install.packages("shiny")
install.packages("dplyr")
install.packages("ggplot2")
library(shiny)
library(dplyr)
library(ggplot2)
server <- function(input, output){ 
  tabulka <- reactive({
    read.csv("./Data/lesson2_KPI.csv")
  })
  output$graph <- renderPlot(
    tabulka %>% 
      mutate(Prof = Premium - Expenses - Losses) %>% 
      group_by(input$chosen_par) %>% 
      summarize(Prof = sum(Prof, na.rm = TRUE)) %>% 
      ggplot(aes(x = reorder(Year, Prof), y = Prof)) + 
      geom_point() 
    
  )
} 
