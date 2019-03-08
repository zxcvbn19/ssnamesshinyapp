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

#### To do:


#Create switch that returns empty plot with overlaid text that says "No Results Found" if
#a name shows up with no matches.

#See if that gets us a working plot, and fiddle with the ui features to make it look pretty

#STOP: Put the images in your power point.

#Work on the "This name was the Xth most popular name that year"

#delve into leaflet options, see if we can get a working output at all.

#doesn't have to look pretty, just has to be something