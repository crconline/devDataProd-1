# server.R for the shiny app
# Carlos Rodriguez, PhD
# Loading required packages and files
library(shiny)
##library(HH)
library(markdown)

fileURL <- "https://dl.dropboxusercontent.com/u/95175494/datasets/likertscale.csv"
download.file(fileURL, destfile = "likertscale.csv", method = "curl")
likert <- read.csv("likertscale.csv", na.strings = c("","NA"), colClasses = rep("factor", 42), header = TRUE)

fileURL2 <- "https://dl.dropboxusercontent.com/u/95175494/datasets/itemstext.csv"
download.file(fileURL2, destfile = "itemstext.csv", method = "curl")
texts <- read.csv("itemstext.csv", colClasses = c("factor", "character"))

fileURL3 <- "https://dl.dropboxusercontent.com/u/95175494/datasets/theIntro.html"
download.file(fileURL3, destfile = "theIntro.html", method = "curl")

# Definition of server.R
shinyServer(function(input, output) {
    
    # Generate the introduction text
    output$introText <- renderUI({
        includeHTML("theIntro.html")
        })
    
    # Generate a plot of the data. 
    output$plot <- renderPlot({
        
        selection <- input$item     
        switch(selection,
               c1i1 = {numitem <- 3},
               c1i2 = {numitem <- 4},
               c1i3 = {numitem <- 5},
               c1i4 = {numitem <- 6},
               c1i5 = {numitem <- 7},
               c1i6 = {numitem <- 8},
               c2i1 = {numitem <- 9},
               c2i2 = {numitem <- 10},
               c2i3 = {numitem <- 11},
               c2i4 = {numitem <- 12},
               c2i5 = {numitem <- 13},
               c2i6 = {numitem <- 14},
               c2i7 = {numitem <- 15},
               c2i8 = {numitem <- 16},
               c2i9 = {numitem <- 17},
               c2i10 = {numitem <- 18},
               c2i11 = {numitem <- 19},
               c3i1 = {numitem <- 20},
               c3i2 = {numitem <- 21},
               c3i3 = {numitem <- 22},
               c3i4 = {numitem <- 23},
               c3i5 = {numitem <- 24},
               c4i1 = {numitem <- 25},
               c4i2 = {numitem <- 26},
               c4i3 = {numitem <- 27},
               c5i1 = {numitem <- 28},
               c5i2 = {numitem <- 29},
               c5i3 = {numitem <- 30},
               c5i4 = {numitem <- 31},
               c5i5 = {numitem <- 32},
               c5i6 = {numitem <- 33},
               c6i1 = {numitem <- 34},
               c6i2 = {numitem <- 35},
               c6i3 = {numitem <- 36},
               c6i4 = {numitem <- 37},
               c6i5 = {numitem <- 38},
               c6i6 = {numitem <- 39},
               c6i7 = {numitem <- 40},
               c6i8 = {numitem <- 41},
               c6i9 = {numitem <- 42}
        )
        
        xt <- xtabs(~ TRAT + likert[ ,numitem], data = likert)
        dimnames(xt) = list("Treatment"=c("BSC","HO"),"Responses"=c("Strongly Disagree", "Disagree","Neutral","Agree","Strongly Agree"))
#         likert(xt, horizontal=FALSE, aspect=1.5,
#                main="Likert Item Selected",
#                auto.key=list(space="right", columns=1, reverse=TRUE, padding.text=2),
#                sub="Responses from BSC (Experimental groups) and HO (Control groups)")

        barplot(xt, beside = TRUE, legend=levels(likert$TRAT),
                main="Likert Item Selected", col =  c("red","blue"),
                sub="Responses from BSC (Experimental groups) and HO (Control groups)")
        })
    
    # Generate a CHI Square test for the item
    output$summary <- renderPrint({
        
        selection <- input$item     
        switch(selection,
               c1i1 = {numitem <- 3},
               c1i2 = {numitem <- 4},
               c1i3 = {numitem <- 5},
               c1i4 = {numitem <- 6},
               c1i5 = {numitem <- 7},
               c1i6 = {numitem <- 8},
               c2i1 = {numitem <- 9},
               c2i2 = {numitem <- 10},
               c2i3 = {numitem <- 11},
               c2i4 = {numitem <- 12},
               c2i5 = {numitem <- 13},
               c2i6 = {numitem <- 14},
               c2i7 = {numitem <- 15},
               c2i8 = {numitem <- 16},
               c2i9 = {numitem <- 17},
               c2i10 = {numitem <- 18},
               c2i11 = {numitem <- 19},
               c3i1 = {numitem <- 20},
               c3i2 = {numitem <- 21},
               c3i3 = {numitem <- 22},
               c3i4 = {numitem <- 23},
               c3i5 = {numitem <- 24},
               c4i1 = {numitem <- 25},
               c4i2 = {numitem <- 26},
               c4i3 = {numitem <- 27},
               c5i1 = {numitem <- 28},
               c5i2 = {numitem <- 29},
               c5i3 = {numitem <- 30},
               c5i4 = {numitem <- 31},
               c5i5 = {numitem <- 32},
               c5i6 = {numitem <- 33},
               c6i1 = {numitem <- 34},
               c6i2 = {numitem <- 35},
               c6i3 = {numitem <- 36},
               c6i4 = {numitem <- 37},
               c6i5 = {numitem <- 38},
               c6i6 = {numitem <- 39},
               c6i7 = {numitem <- 40},
               c6i8 = {numitem <- 41},
               c6i9 = {numitem <- 42}
        )
        
        xt <- xtabs(~ TRAT + likert[ ,numitem], data = likert)
        dimnames(xt) = list("Treatment"=c("BSC","HO"),"Responses"=c("Strongly Disagree", "Disagree","Neutral","Agree","Strongly Agree"))
        chisq.test(xt)
        
    }) 
    
    # Generate a Crosstab
    output$cross <- renderTable({
       
        selection <- input$item     
        switch(selection,
               c1i1 = {numitem <- 3},
               c1i2 = {numitem <- 4},
               c1i3 = {numitem <- 5},
               c1i4 = {numitem <- 6},
               c1i5 = {numitem <- 7},
               c1i6 = {numitem <- 8},
               c2i1 = {numitem <- 9},
               c2i2 = {numitem <- 10},
               c2i3 = {numitem <- 11},
               c2i4 = {numitem <- 12},
               c2i5 = {numitem <- 13},
               c2i6 = {numitem <- 14},
               c2i7 = {numitem <- 15},
               c2i8 = {numitem <- 16},
               c2i9 = {numitem <- 17},
               c2i10 = {numitem <- 18},
               c2i11 = {numitem <- 19},
               c3i1 = {numitem <- 20},
               c3i2 = {numitem <- 21},
               c3i3 = {numitem <- 22},
               c3i4 = {numitem <- 23},
               c3i5 = {numitem <- 24},
               c4i1 = {numitem <- 25},
               c4i2 = {numitem <- 26},
               c4i3 = {numitem <- 27},
               c5i1 = {numitem <- 28},
               c5i2 = {numitem <- 29},
               c5i3 = {numitem <- 30},
               c5i4 = {numitem <- 31},
               c5i5 = {numitem <- 32},
               c5i6 = {numitem <- 33},
               c6i1 = {numitem <- 34},
               c6i2 = {numitem <- 35},
               c6i3 = {numitem <- 36},
               c6i4 = {numitem <- 37},
               c6i5 = {numitem <- 38},
               c6i6 = {numitem <- 39},
               c6i7 = {numitem <- 40},
               c6i8 = {numitem <- 41},
               c6i9 = {numitem <- 42}
        )
        
        xt <- xtabs(~ TRAT + likert[ ,numitem], data = likert)
        dimnames(xt) = list("Treatment"=c("BSC","HO"),"Responses"=c("Strongly Disagree", "Disagree","Neutral","Agree","Strongly Agree"))
        xt
    })
    
    # Generate the text item
    output$text <- renderText({
        it <- input$item
        texts[which(texts$it == it), 2] 
    })
})
