####============================================================================
#### Coursera   : Data Scientist Track
#### Course:      Exploratory Data Analysis
#### Week:        1
#### Assignment : Plot UCI Data
####
#### Name: Tony Leson
#### Date: 2/14/2017
#### File: plot2.R
####
#### Description:
####   This file will read, clean, and plot data from UCI Dataset.
#### 
####   plot2 is a graph of the Global Active Power vs time.  
####      (from feb.1.2007 to feb.2.2007)
####   
#### Functions: none
#### 
#### Dependencies: none
####
####
####============================================================================

# Read in the data prefiltered and cleaned for plotting.
source("download_load_ucidata.R")

# Main variable of interaction is "pow_df"

if(!exists("pow_df")) stop("Main Data not found: pow_df")

##--------------------------------------------------------
## Setup Output Device
##--------------------------------------------------------
png(filename = "plot2.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

##--------------------------------------------------------
## Create Plot
##--------------------------------------------------------
plot.new()
plot(pow_df$Global_active_power,  type = "l", main = "",
     ylab = "Global Active Power (Kilowatts)", xlab = "" , xaxt = "n")

num_entries = length(pow_df$Global_active_power)
axis(side=1, at= c(1,num_entries/2,num_entries), labels = c("Thu","Fri","Sat"))

##--------------------------------------------------------
## Flush plot to plot2.png
##--------------------------------------------------------

dev.off()
