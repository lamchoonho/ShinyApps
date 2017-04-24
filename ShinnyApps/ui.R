# Name: LAM CHOON HO
# Date: 23 Apr 2017
# Title: Shiny Application and Reproducible Pitch

library(shiny)

shinyUI(
  navbarPage("Demographoc Analysis Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("Demographic Analysis for Midwestern United States - Explore Relationship Between 2 Population of Races"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("statemw", "State:",
                                        choices = c("Illinois"='IL',
                                                    "Indiana"='IN',
                                                    "Michigan"='MI',
                                                    "Ohio"='OH',
                                                    "Wisconsin"='WI'
                                        )),
                            selectInput("populationmwx", "Population of Race (x-axis):",
                                        choices = c("White" = "popwhite",
                                          "Black" = "popblack",
                                          "American Indian" = "popamerindian",
                                          "Asian" = "popasian",
                                          "Other" = "popother"
                                        )),
                            selectInput("populationmwy", "Population of Race (y-axis):",
                                        choices = c("White" = "popwhite",
                                                    "Black" = "popblack",
                                                    "American Indian" = "popamerindian",
                                                    "Asian" = "popasian",
                                                    "Other" = "popother"
                                        )),
                            checkboxInput("regressionline", "Add Regression Line", FALSE),
                            actionButton("Submit","Submit",icon("refresh")),
                            h4("Note: Please select the criteria and press Submit button to start", style = "color:blue")
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Relationship of 2 Populations", br(), textOutput("out1"), plotOutput("midwestxyplot")),
                                        tabPanel("Populate Records", br(), strong(h2(textOutput("out2"))), dataTableOutput("mytable1"))
                            )
                          )
                        )
                      )
             ),
             tabPanel("Read Me (Documentation)",
                      h2("Demographic Analysis for Midwestern United States"),
                      hr(),
                      h3("Description"),
                      helpText("Demographic information of midwest counties with a data frame (midwest) with 437 rows and 28 variables"),
                      h3("Variables"),
                      helpText("The variables are PID, county, state, area, poptotal (Total population), popdensity (Population density),",
                               "popwhite (Number of whites), popblack (Number of blacks), popamerindian (Number of American Indians),", 
                                "popasian (Number of Asians), popother (Number of other races), percwhite (Percent white),", 
                                "percblack (Percent black), percamerindan (Percent American Indian), percasian (Percent Asian),", 
                                "percother (Percent other races), popadults (Number of adults), perchsd, percollege (Percent college educated), percprof (Percent profession), poppovertyknown, percpovertyknown, percbelowpoverty, percchildbelowpovert, percadultpoverty, percelderlypoverty, inmetro (In a metro area) and category"),
                      h3("Focus Area"),
                      helpText("Midwestern United States' Demographic - Explore Relationship Between 2 Population of Races. Populate table of records by State."),
                      h3("Read more for midwest dataset"),
                      a("http://www-eio.upc.edu/~pau/cms/rdata/doc/ggplot2/midwest.html"),
                      hr(),
                      h2("How to use the Shiny Application"),
                      h3("Relationship of 2 Populations"),
                      helpText("First, Identify the State which the user what to explore. Second",
                                "Select 2 population of races to explore their relationship and regression linear."),
                      h3("Poulate Records"),
                      helpText("User can examine the records from midwest dataset by selecting state."),
                      hr(),
                      h2("Assignment's Links"),
                      hr(),
                      h3("Shiny Application"),
                      a("https://lamchoonho.shinyapps.io/ShinnyApps/"),
                      h3("Github Repository"),
                      a("https://github.com/lamchoonho/ShinyApps"),
                      h3("Reproducible Pitch"),
                      a("http://rpubs.com/lamchoonho/shinyapps")
             )
  )
)