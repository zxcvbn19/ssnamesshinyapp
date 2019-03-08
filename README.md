# ssnamesshinyapp
R Shiny App
To run:
Download R and RStudio if you haven't already:
https://cran.mtu.edu/
https://www.rstudio.com/products/rstudio/download/

A quick cheat sheet for running shiny apps:
https://shiny.rstudio.com/images/shiny-cheatsheet.pdf

Some examples of shiny apps:
https://shiny.rstudio.com/gallery/

Run the following line of code into the console in RStudio:
install.packages(c("shiny","dplyr","ggplot2","leaflet"),dependencies=TRUE)

To run the app:
-Download all the files here into one folder.
-Open the server.R and/or ui.R files in RStudio

If you run into issues, you may have to set your working directory in global.R to wherever you have it saved. Something like:
setwd("C:/shinyappisinthisdirectory")

Ideas/Known Things to address:
1) The "maxyear" value that it prints when the app prints when your name is most popular is really only the max for one sex instead of using the sum of both sexes. I don't remember exactly why I did that but that should be an easy fix. The "youryear" value is correct for some reason.

2) If I remember correctly, I tried using a conditionalPanel() command to return a string like "Sorry, I can't find that name" if the typed name wasn't found. Again, should be an easy fix: I need to create a logical inside server.R to check if the string the user types is in the dataset, then use conditionalPanel() inside ui.R that checks that logical, and only shows the graph and such if the name exists. I think the issue I was having was with the Javascript logical to check the value inside server.R. 

3) For loops are super slow in R, so the one I use to create a working dataset "plotdat" in server.R should probably be redone using the apply() function or something similar. For now I think it runs decently fast so I'm not worried about it.

4) Adding a submit button so it doesn't constantly check as you type in a name is probably a good idea, instead of constantly checking as the user types in a name. This requires reworking the reactive code to delay checking until a button is clicked.

5) Rather than using the slider, it would be nice to make the plot interactive, so as you hover over it it tells you the number of male/female names for that year.

6) Using the leaflet package, we should be able to create a map and color code it with the popularity of a name in that state for the given year they choose in the slider. Need to download census data so we can get the popularity of a name over the number of people in that state for that year. This will probably take some time.

7) In that same vein, make it so that when you click on/hover over a state it tells you how many people in that state had the name.

8) It says this in the cheat sheet, but if we want to add custom CSS, integrating it into the UI is as simple as adding the line of code includeCSS("filename.css"). Similarly to include javascript it's includeScript(). Accessing HTML tags to create custom layouts uses the "tags" function in R Shiny. Here are some links with examples:
https://shiny.rstudio.com/articles/html-tags.html
https://shiny.rstudio.com/articles/tag-glossary.html

We can probably make it real pretty with a bit of work.
