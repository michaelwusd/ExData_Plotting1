# read data from the file
entireData <- read.table("household_power_consumption.txt", header = T, sep = ";")
dateOne <- (as.character(entireData$Date) == "1/2/2007")
dateTwo <- (as.character(entireData$Date) == "2/2/2007")
plotData <- entireData[dateOne | dateTwo,]

# create plot1.png
png(file = "plot1.png")
hist(as.numeric(as.character(plotData$Global_active_power)), xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")
dev.off()
