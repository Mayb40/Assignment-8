library(shiny)
library(ggplot2)

#Function that passes string variables to ggplot
myplotfunct = function(df, x_string, y_string) {
  ggplot(df, aes_string(x = x_string, y = y_string)) + geom_point()
}

shinyServer(function(input, output) {
  
  # Sepal Code
  datasetInput1 <- reactive({
    switch(input$dataset1,
           "Sepal Length" = "Sepal.Length",
           "Sepal Width" = "Sepal.Width")
  })
  
  # Petal Code
  datasetInput2 <- reactive({
    switch(input$dataset2,
           "Petal Length" = "Petal.Length",
           "Petal Width" = "Petal.Width")
  })
  
  # Plot
  output$myplot = renderPlot({
    return(myplotfunct(iris, datasetInput1(), datasetInput2()))})
  
})
