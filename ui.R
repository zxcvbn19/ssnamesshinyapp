library(shiny)
# library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  column(4,
         wellPanel(textInput(inputId="n",label="Name",value="Zachary"),
  sliderInput(inputId="year",label="Year",min=1880,max=2017,value=1991,step=1,sep="")
  # submitButton()
  )
  )
  ,
  column(8,
  

  plotOutput(outputId="nameplot"),
  #state how popular the name was that year
  textOutput(outputId="maxyear"),
  textOutput(outputId="youryear")
 
  # leafletOutput()

)
))

