<<<<<<< HEAD
# https://github.com/webgeekstress/ExData_Plotting1
=======
>>>>>>> 9001d8a3c1a0fba3ddc2e9b0a48d3927395c734d
# Creating a png of a histogram of Global Reactive Power 
# for the dates 2/1/2007 and 2/2/2007
# Based upon Electric Power Consumption Data provided by
# UC Irvine Machine Learning Repository 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

<<<<<<< HEAD
# Loading, subsetting, and formatting the data; 
# the source data is in the working directory
colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")

columnClasses <- c("Date", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric" )
dat <- read.table("household_power_consumption.txt", 
                  sep=";", 
                  col.names=colNames, 
                  colClasses= columnClasses,
=======
# Loading, subsetting, and formatting the data
colNames <- c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-metering 1", "Sub-metering 2", "Sub-metering 3")
#colClasses <- c("Date", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric" )
dat <- read.table("household_power_consumption.txt", 
                  sep=";", 
                  col.names=colNames, 
>>>>>>> 9001d8a3c1a0fba3ddc2e9b0a48d3927395c734d
                  na.strings="?",
                  header=TRUE,
                  stringsAsFactors=FALSE)

dat<- subset(dat, (dat$Date == "1/2/2007" | dat$Date== "2/2/2007")) 
dat$DateTime <- strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")

# Plotting the histogram and saving as a png file
png(file="plot1.png", height=480, width=480, bg="transparent")
hist(dat$Global.Active.Power, 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()

rm(list=ls()) # Cleaning up 
