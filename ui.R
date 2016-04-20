library(shiny)

fluidPage(
  titlePanel(h2("Predicting Your Car's Fuel Efficiency", align="center")),
  br(), 
  br(),
  sidebarLayout(
    sidebarPanel(
      sliderInput("wt", "Weight of the car (in thousand pounds):",  
                  min = 1, max = 6, value = 3, step = .2, animate = FALSE),
      
      sliderInput("qsec", "Acceleration time from start to 0.25 mile (in seconds)",  
                  min = 14, max = 23, value = 18, step = .2, animate = FALSE),

      selectInput("am", label = "Transmission Type",
                  choices = list("automatic" = "automatic", "manual" = "manual")),
      br(),
      actionButton("goButton", "Predict!"),
      p("Click the button to find out your car's fuel efficiency.")
    ),
    
    mainPanel(
      h3("Predicted fuel efficency (in miles per gallon gas):"), 
      br(),
      verbatimTextOutput("pred"),    
      tags$hr(),
      h3("You entered:"),
      br(),
      h4("The weight of your car (in thousand lbs):"),
      verbatimTextOutput("wt"),
      h4("Accerelation time from start to 1/4 mile (in seconds):"),
      verbatimTextOutput("qsec"),
      h4("The trasmission of your car:"),
      verbatimTextOutput("am")
    )
  )
)



