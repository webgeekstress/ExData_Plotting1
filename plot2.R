# Creating a png of a line graph of Global Reactive Power as a function of time
# for the dates 2/1/2007 and 2/2/2007
# Based upon Electric Power Consumption Data provided by
# UC Irvine Machine Learning Repository 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Loading, subsetting, and formatting the data
colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")
dat <- read.table("household_power_consumption.txt", 
                  sep=";", 
                  col.names=colNames, 
                  na.strings="?")

dat <- dat[dat$Date == "1/2/2007"|dat$Date == "2/2/2007", ]

dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Plotting the line chart and saving as a png file
png(file="plot2.png", height=480, width=480, bg="transparent")
plot(dat$DateTime, dat$Global.Active.Power, 
    type="l",
    ylab="Global Active Power (kilowatts)",
    xlab="")
dev.off()

rm(list=ls()) # Cleaning up 
