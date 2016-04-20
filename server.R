library(shiny)

# all sessions scope
mtcars$am <- factor(mtcars$am)
levels(mtcars$am) <- c('automatic', 'manual')
fit <- lm(mpg ~ ., mtcars)
bestfit <- step(fit, direction="backward")

function(input, output) {
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
    
    pred <- eventReactive(input$goButton, {
        newdata <- data.frame( wt=as.numeric(wt()), 
                              qsec=as.numeric(qsec()), am=am() )
        round(predict(bestfit, newdata), 2)
    })
    
    output$pred <- renderText({
        pred()
    })
}  
  
