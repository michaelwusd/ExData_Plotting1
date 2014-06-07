# read data from the file
entireData <- read.table("household_power_consumption.txt", header = T, sep = ";")
dateOne <- (as.character(entireData$Date) == "1/2/2007")
dateTwo <- (as.character(entireData$Date) == "2/2/2007")
plotData <- entireData[dateOne | dateTwo,]

# create plot2.png
png(file = "plot2.png")
date <- as.Date(strptime(as.character(plotData$Date), format="%d/%m/%Y"))
plotData$DateTime <- as.POSIXct(paste(date, plotData$Time), format="%Y-%m-%d %H:%M:%S")
plot(plotData$DateTime, plotData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
