library(shiny)

AUprediction<-function(UV,SR) exp(0+(log(UV)*0.753)+(log(SR/100)*0.421))
shinyServer(
  function(input, output) {
    output$inputUV<-renderPrint({input$UV})
    output$inputSR<-renderPrint({input$SR})
    output$prediction<-renderPrint({
      validate(
      need(input$UV>0 & input$UV<=100000000,"Please input Monthly Unique Visitors between 0 and 100000000"),
      need(input$SR>=0 & input$SR<=100,"Please select a Stop Rate between 0 and 100"))
    floor(AUprediction(input$UV,input$SR))
    })
  }
)