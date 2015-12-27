library(shiny)

shinyServer(function(input, output) {
  
  wt <- eventReactive(input$goButton, {
    input$wt
  })
  
  output$wt <- renderText({
    wt()
  })
  
  qsec <- eventReactive(input$goButton, {
    input$qsec
  })
  
  output$qsec <- renderText({
    qsec()
  })
  
  
  am <- eventReactive(input$goButton, {
    input$am
  })
  
  output$am <- renderText({
    am()
  })
  
  mtcars$am <- factor(mtcars$am)
  levels(mtcars$am) <- c('automatic', 'manual')
  fit <- lm(mpg ~ ., mtcars)
  bestfit <- step(fit, direction="backward")
  
  pred <- eventReactive(input$goButton, {
    
    wt <- as.numeric(wt())
    qs <- as.numeric(qsec())
    tm <- am()

    newdata <- data.frame(wt=wt, qsec=qs, am=tm )

    round(predict(bestfit, newdata), 2)
  })
  
  output$pred <- renderText({
    pred()
  })
  
} ) 
  
