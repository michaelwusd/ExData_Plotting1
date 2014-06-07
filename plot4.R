# read data from the file
entireData <- read.table("household_power_consumption.txt", header = T, sep = ";")
dateOne <- (as.character(entireData$Date) == "1/2/2007")
dateTwo <- (as.character(entireData$Date) == "2/2/2007")
plotData <- entireData[dateOne | dateTwo,]

# create plot4.png
png(file = "plot4.png")
date <- as.Date(strptime(as.character(plotData$Date), format="%d/%m/%Y"))
plotData$DateTime <- as.POSIXct(paste(date, plotData$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
# plot topleft
plot(plotData$DateTime, plotData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# plot topright
plot(plotData$DateTime, plotData$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot bottomleft
plot(plotData$DateTime, plotData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotData$DateTime, plotData$Sub_metering_2, type="l", col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
# plot bottomright
plot(plotData$DateTime, plotData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
