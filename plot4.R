####============================================================================
#### Coursera   : Data Scientist Track
#### Course:      Exploratory Data Analysis
#### Week:        1
#### Assignment : Plot UCI Data
####
#### Name: Tony Leson
#### Date: 2/14/2017
#### File: plot3.R
####
#### Description:
####   This file will read, clean, and plot data from UCI Dataset.
#### 
####   plot2 is a graph of the three sub-metering variablesr vs time.  
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
png(filename = "plot1.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)


##--------------------------------------------------------
## Create Plot1
##--------------------------------------------------------
plot.new()
par(mfrow = c(2,2))

# Get the number of rows in order to place Day symbols.
num_entries = length(pow_df$Global_active_power)


#--------------
# Subplot 1
#--------------
plot(pow_df$Global_active_power,  type = "l", main = "",
     ylab = "Global Active Power", xlab = "" , xaxt = "n")

axis(side=1, at= c(1,num_entries/2,num_entries), labels = c("Thu","Fri","Sat"))


#--------------
# Subplot 2
#--------------
plot(pow_df$Voltage,  type = "l", main = "",
     ylab = "Voltage", xlab = "datetime" , xaxt = "n")

axis(side=1, at= c(1,num_entries/2,num_entries), labels = c("Thu","Fri","Sat"))


#--------------
# Subplot 3
#--------------
plot(pow_df$Sub_metering_1,  type = "l", main = "", col = "darkgreen",
     ylab = "Energy sub metering", xlab = "" , xaxt = "n")

points(pow_df$Sub_metering_2, type = "l", col= "red")
points(pow_df$Sub_metering_3, type = "l", col= "blue")
legend("topright",lty=1,col=c("darkgreen","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
axis(side=1, at= c(1,num_entries/2,num_entries), labels = c("Thu","Fri","Sat"))


#--------------
# Subplot 4
#--------------
plot(pow_df$Global_reactive_power,  type = "l", main = "",
     ylab = "Global Reactive Power", xlab = "datetime" , xaxt = "n")

axis(side=1, at= c(1,num_entries/2,num_entries), labels = c("Thu","Fri","Sat"))


##--------------------------------------------------------
## Flush plot to plot4.png
##--------------------------------------------------------

dev.off()
