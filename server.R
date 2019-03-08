library(shiny)
library(ggplot2)
# library(stringr)
# library(leaflet)
library(dplyr)

shinyServer(function(input, output) {
  natdat=reactive(subset(national,name==input$n))
  ## Graph ################################################
  plotdat=reactive({
    values=cbind.data.frame(year=rep(1880:2017,2),count=rep(0,138*2),sex=c(rep("M",138),rep("F",138)))
   for(i in 1:dim(natdat())[1]){
    values[which(values$year==natdat()$year[i] & values$sex==natdat()$sex[i]),2]=natdat()$count[i]
   }
    values
  })
  output$table=renderTable(plotdat())
  output$nameplot=renderPlot({ggplot(data=plotdat(),aes(x=year,y=count))+
    geom_line(aes(group=sex,color=sex))+
    ggtitle(paste0("Historical U.S. Usage of the Name ",input$n))+
    xlab("Year")+
    ylab("Number of Babies Given Name")+
    theme_bw()
  })
  output$maxyear=renderText(paste0(input$n," was most common in ",
                            plotdat()[which(plotdat()$count==max(plotdat()$count)),"year"],", with ",
                            plotdat()[which(plotdat()$count==max(plotdat()$count)),"count"]," occurences."))
  output$youryear=renderText(paste0(sum(plotdat()[which(plotdat()$year==input$year),"count"])," people were named ",
                      input$n," in the year ",input$year,"."))

  ## Create Interactive Map ###############################
  # output$map=renderLeaflet()
  output$namenotfound=reactive({ifelse(dim(natdat())[1]==0,TRUE,FALSE)})
  outputOptions(output,"namenotfound",suspendWhenHidden=FALSE)
  
})