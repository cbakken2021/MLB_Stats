# MLB_Stats

The purpose of this project is to see the evolution of baseball through statistics as well as evaluate individual players, teams, and leagues through time. Below is the final R code to access the application (to run locally through R), followed by a web link to access the application.

runGitHub("MLB_Stats", "cbakken2021", ref = "main")

https://cbakken2021.shinyapps.io/mlb_stats/

A useful link for a walkthrough of the application can be found here - https://github.com/cbakken2021/MLB_Stats/blob/main/MLB_Stats%20Instructions.pdf

The dataset used includes baseball statistics from 1871-2020, but has been filtered to only include data from 1951-2020 (many statistics were not recorded in early years, so the outlying years were excluded). 

CITED RESOURCE: https://github.com/cdalzell/Lahman - This github link shows how to install the Lahman database in RStudio and allows user access to the entire dataset.

The user will be able to see specific players averages throughout their careers on the first module.  The second module allows the user to input any two (or three) statistics of their desire to see how they are correlated with one another; the user can use either continuous or categorical variables to best visualize any information they may desire.  The third module will allow a user to perform regression analysis and compare any variables they desire (along with combinations of variables).  The user then will be able to predict the model following their output.


