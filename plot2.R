# Creating a png of a line graph of Global Reactive Power as a function of time
# for the dates 2/1/2007 and 2/2/2007
# Based upon Electric Power Consumption Data provided by
# UC Irvine Machine Learning Repository 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# "Subsetting" the data before loading it all in
# Manual inspection of the text file reveals that the data for 2/1/2007  
# begins at row 66638 and the data for 2/3/2007 begins at row 69518

firstRow  <- 66638 
lastRow <- 69518 
numRows  <- lastRow-firstRow  

# Loading and formatting the data

colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")
dat <- read.table("household_power_consumption.txt", 
                  sep=";", 
                  skip=66637, 
                  nrow=numRows, 
                  col.names=colNames, 
                  na.strings="?")
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Plotting the line chart and saving as a png file
png(file="plot2.png", height=480, width=480, bg="transparent")
plot(dat$DateTime, dat$Global.Active.Power, 
    type="l",
    ylab="Global Active Power (kilowatts)",
    xlab="")
dev.off()

rm(list=ls()) # Cleaning up 
