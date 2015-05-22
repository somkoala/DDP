library(shiny)
options(scipen=999)
shinyUI(
  pageWithSidebar(
  headerPanel("Paywall Subscriber prediction for a news website"),
  sidebarPanel(
    h6('This application is a simple calculator that predicts the potential number of subscribers should a news site decide to implement a paywall. It takes into account the size of the size expressed as Monthly Unique Visitors and the desired portion of visitors impacted (also known as Stop Rate) to account for how tight/loose the paywall is.'),
    numericInput('UV','Your number of Monthly Unique Visitors',value=0,min=0,max=100000000,step=100000),
    numericInput('SR','% of users you would like monetize (Stop Rate)',value=0,min=0,max=100,step=5),
    submitButton('Calculate')
  ),
  mainPanel(
    h3('Monthly Unique Visitors'),
    verbatimTextOutput("inputUV"),
    h3('Expected Stop Rate'),
    verbatimTextOutput("inputSR"),
    h3('Expected number of Subscribers'),
    verbatimTextOutput("prediction"),
    h4('If you would like to know more about the potential of your site, contact us at fakemail@evilpaywallcompany.com!')
    )
))