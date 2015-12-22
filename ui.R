shinyUI(fluidPage(
    
    titlePanel("Analysing the Likert Scale of Computer Supported Strategic Planning @ UNAM"),
    
    sidebarLayout(
        
        sidebarPanel(
            # Inputs excluded for brevity
            selectInput("dist", "Choose a distribution",
                        choices =  c("Normal" = "norm",
                                     "Uniform" = "unif",
                                     "Log Normal" = "lnorm",
                                     "Exponential" = "exp"),
                        selected = "lnorm"),
            
            sliderInput("n",
                        "Size of sample:",
                        min = 1,
                        max = 5000,
                        value = 2000)
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("Intro", includeMarkdown("intro.md")),
                tabPanel("Item Text"),
                tabPanel("Plot", plotOutput("plot")), 
                tabPanel("Summary", verbatimTextOutput("summary")), 
                tabPanel("Cross Tab", tableOutput("table"))
            )
        )
    )
))
