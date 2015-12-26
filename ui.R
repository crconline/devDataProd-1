# ui.R for the shiny app
# Carlos Rodriguez, PhD
library(shiny)
library(markdown)
shinyUI(fluidPage(
    
    titlePanel("Analysing the Likert Scale of Computer Supported Strategic Planning @ UNAM"),
    
    sidebarLayout(
        
        sidebarPanel(
            selectInput("item", "Choose an Item",
                        choices =  c("Construct 1 Item 1" = "c1i1",
                                     "Construct 1 Item 2" = "c1i2",
                                     "Construct 1 Item 3" = "c1i3",
                                     "Construct 1 Item 4" = "c1i4",
                                     "Construct 1 Item 5" = "c1i5",
                                     "Construct 1 Item 6" = "c1i6",
                                     "Construct 2 Item 1" = "c2i1",
                                     "Construct 2 Item 2" = "c2i2",
                                     "Construct 2 Item 3" = "c2i3",
                                     "Construct 2 Item 4" = "c2i4",
                                     "Construct 2 Item 5" = "c2i5",
                                     "Construct 2 Item 6" = "c2i6",
                                     "Construct 2 Item 7" = "c2i7",
                                     "Construct 2 Item 8" = "c2i8",
                                     "Construct 2 Item 9" = "c2i9",
                                     "Construct 2 Item 10" = "c2i10",
                                     "Construct 2 Item 11" = "c2i11",
                                     "Construct 3 Item 1" = "c3i1",
                                     "Construct 3 Item 2" = "c3i2",
                                     "Construct 3 Item 3" = "c3i3",
                                     "Construct 3 Item 4" = "c3i4",
                                     "Construct 3 Item 5" = "c3i5",
                                     "Construct 4 Item 1" = "c4i1",
                                     "Construct 4 Item 2" = "c4i2",
                                     "Construct 4 Item 3" = "c4i3",
                                     "Construct 5 Item 1" = "c5i1",
                                     "Construct 5 Item 2" = "c5i2",
                                     "Construct 5 Item 3" = "c5i3",
                                     "Construct 5 Item 4" = "c5i4",
                                     "Construct 5 Item 5" = "c5i5",
                                     "Construct 5 Item 6" = "c5i6",
                                     "Construct 6 Item 1" = "c6i1",
                                     "Construct 6 Item 2" = "c6i2",
                                     "Construct 6 Item 3" = "c6i3",
                                     "Construct 6 Item 4" = "c6i4",
                                     "Construct 6 Item 5" = "c6i5",
                                     "Construct 6 Item 6" = "c6i6",
                                     "Construct 6 Item 7" = "c6i7",
                                     "Construct 6 Item 8" = "c6i8",
                                     "Construct 6 Item 9" = "c6i9"),
                                    selected = "c1i1")
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("Intro", uiOutput("introText")),
                tabPanel("Item Text", textOutput("text")),
                tabPanel("Likert Plot", plotOutput("plot")), 
                tabPanel("CHI SQ Test", verbatimTextOutput("summary")), 
                tabPanel("Crosstab", tableOutput("cross"))
            )
        )
    )
))
