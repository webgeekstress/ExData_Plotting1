# Creating a png of a set of four graphs showing
# global active power, voltage, energy submetering, and global reactive power
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

# Plotting the various charts and saving as a png file
png(file="plot4.png", height=480, width=480, bg="transparent", type="cairo")

par(mfrow=c(2,2))
# The global reactive power chart from plot2.R
plot(dat$DateTime, dat$Global.Active.Power,
     type="l",
     ylab="Global Active Power",
     xlab="")
# Voltage
plot(dat$DateTime, dat$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

# The submetering chart created in from plot3.R 
# (Except this time, there's no box around the legend)
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
       col=c("black", "red", "blue"), 
       bty="n")

# And last but not least, global reactive power
# No matter what I do, this graph comes out looking "heavier" than the model; 
# From forum postings, it appears that this may just be an OS-rendering issue (I'm on WinXP)
plot(dat$DateTime, dat$Global.Reactive.Power,
     type="n",
     ylab="Global_reactive_power",
     xlab="datetime", 
     lwd=0.5)
lines(dat$DateTime, dat$Global.Reactive.Power,
      lty=1)
dev.off()

rm(list=ls()) # Cleaning up 
