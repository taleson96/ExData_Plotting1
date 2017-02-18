####============================================================================
#### Coursera   : Data Scientist Track
#### Course:      Exploratory Data Analysis
#### Week:        1
#### Assignment : Plot UCI Data
####
#### Name: Tony Leson
#### Date: 2/14/2017
#### File: plot1.R
####
#### Description:
####   This file will read, clean, and plot data from UCI Dataset.
####    
####     Plot1 is a histogram of the Global Active Power over the dataset
####      (from feb.1.2007 to feb.2.2007)
####   
#### Functions: none
#### 
#### Dependencies: none
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
png(filename = "plot1.png",
    width = 504, height = 504, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

##--------------------------------------------------------
## Create Plot1
##--------------------------------------------------------
plot.new()
hist(pow_df$Global_active_power, breaks=12, col="red", 
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency",
     main="Global Active Power")

##--------------------------------------------------------
## FLush plot to output plot1.png
##--------------------------------------------------------

dev.off()
