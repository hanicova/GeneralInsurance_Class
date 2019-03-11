UI <- fluidPage(
  selectInput(inputId = "chosen_par", 
              label = "Graph", 
              choices = list("Region", "Unit", "Segment", "Business", "Year")),
  plotOutput(outputId = "graph")
) 

# v serveri chceme menit parameter (input bude z ui) podla ktoreho sa robia zoskupenia
