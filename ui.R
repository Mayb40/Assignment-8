library(shiny)

shinyUI(fluidPage(
  
  # Title
  titlePanel("Petal vs. Sepal"),
  
  # Sidebar with selecting input to view the
  # scatter plot differently
  sidebarLayout(
    sidebarPanel(
      radioButtons("color", label = "Color",
                   choices = list("Green" = 'green', "Blue" = 'blue'),
                   selected = 'blue'),
      
      selectInput("dataset1", "Choose a Sepal Measure:", 
                  choices = c("Sepal Length", "Sepal Width")),
      
      selectInput("dataset2", "Choose a Petal Measure:", 
                  choices = c("Petal Length", "Petal Width"))
    ),
    
    # Scatter Plot
    mainPanel(
      textOutput("testvar"),
      plotOutput("myplot")
    )
  )
))