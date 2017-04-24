# Name: LAM CHOON HO
# Date: 23 Apr 2017
# Title: Shiny Application and Reproducible Pitch

library(shiny)
library(datasets)
library(lattice)
library(plotly)

datamw <- midwest[,c(2,3,5,7,8,9,10,11)]
names(datamw) <- c('County','State','Population','popwhite','popblack','popamerindian','popasian','popother')

shinyServer(function(input, output) {
  
  observeEvent(input$Submit, {
    
    state = input$statemw
    pop1 = input$populationmwx
    pop2 = input$populationmwy

    datamw <-datamw[datamw$State==state,]
    
    if (state == "IL") {
      stateName <- "Illinois"
    } else if (state == "IN") {
      stateName <- "Indiana"
    } else if (state == "MI"){
      stateName <- "Michigan"
    }else if (state == "OH"){
      stateName <- "Ohio"
    }else if (state == "WI"){
      stateName <- "Wisconsin"
    }
    
    if (pop1 == "popwhite") {
      pop1 <- datamw$popwhite
      xlabel <- "Population of White"
    } else if (pop1 == "popblack") {
      pop1 <- datamw$popblack
      xlabel <- "Population of Black"
    } else if (pop1 == "popamerindian"){
      pop1 <- datamw$popamerindian
      xlabel <- "Population of American Indian"
    }else if (pop1 == "popasian"){
      pop1 <- datamw$popasian
      xlabel <- "Population of Asian"
    }else if (pop1 == "popother"){
      pop1 <- datamw$popother
      xlabel <- "Population of Other"
    }
    
    if (pop2 == "popwhite") {
      pop2 <- datamw$popwhite
      ylabel <- "Population of White"
    } else if (pop2 == "popblack") {
      pop2 <- datamw$popblack
      ylabel <- "Population of Black"
    } else if (pop2 == "popamerindian"){
      pop2 <- datamw$popamerindian
      ylabel <- "Population of American Indian"
    }else if (pop2 == "popasian"){
      pop2 <- datamw$popasian
      ylabel <- "Population of Asian"
    }else if (pop2 == "popother"){
      pop2 <- datamw$popother
      ylabel <- "Population of Other"
    }
    
    mainText <- paste("Relationship Between", xlabel, "and", ylabel, "In", stateName, "State")
    out2Text <- paste("Table is populated by", stateName, "State")
    output$out2 <- renderText({out2Text})

        if (input$regressionline == "FALSE"){
      output$midwestxyplot = renderPlot({
        xyplot(pop1 ~ pop2, xlab = xlabel, ylab = ylabel, main = mainText, data=datamw)
      })}else if (input$regressionline == "TRUE"){
        output$midwestxyplot = renderPlot({
        xyplot(pop1 ~ pop2, xlab = xlabel, ylab = ylabel, main = mainText, data=datamw,  type = c("p", "r"))
      })}
    
    output$mytable1 = renderDataTable({
      datamw
    }, options = list(lengthMenu = c(50, 100, 150), pageLength = 50))  
    })
})