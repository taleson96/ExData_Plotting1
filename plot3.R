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

# Some important file paths to download data.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "household_power_consumption.zip"
datafile <- "household_power_consumption.txt"

if(!file.exists(destfile)) {
  # download and unzip file
  download.file(url,destfile)
  unzip(destfile , exdir=".")
}

#------------------------------------------
# Power Consumption Date table.
#------------------------------------------
powtotal_df <- read.table(datafile, sep = ';', header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA","?"))

#-------- using Simple Method ------------------------------
# filter for dates 01/02/2007 02/02/2007 03/02/2007
pow_df <- filter(powtotal_df, Date %in% c("1/2/2007", "2/2/2007"))

#-------- Clean the memory ---------------------------
remove("powtotal_df")


##--------------------------------------------------------
## Setup Output Device
##--------------------------------------------------------
png(filename = "plot3.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)


##--------------------------------------------------------
## Create Plot1
##--------------------------------------------------------
plot.new()
plot(pow_df$Sub_metering_1,  type = "l", main = "", col = "darkgreen",
     ylab = "Energy sub metering", xlab = "" , xaxt = "n")

points(pow_df$Sub_metering_2, type = "l", col= "red")
points(pow_df$Sub_metering_3, type = "l", col= "blue")
legend("topright",lty=1,col=c("darkgreen","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

num_entries = length(pow_df$Global_active_power)
axis(side=1, at= c(1,num_entries/2,num_entries), labels = c("Thu","Fri","Sat"))

##--------------------------------------------------------
## flush plot to plot3.png
##--------------------------------------------------------

dev.off()
