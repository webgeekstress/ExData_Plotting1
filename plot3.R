# Creating a png of a line graph of energy submetering as a function of time
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
png(file="plot3.png", height=480, width=480, bg="transparent")
plot(dat$DateTime, dat$Sub.metering.1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(dat$DateTime, dat$Sub.metering.2,
      col="red")
lines(dat$DateTime, dat$Sub.metering.3,
      col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), 
       col=c("black", "red", "blue"))
dev.off()

rm(list=ls()) # Cleaning up 