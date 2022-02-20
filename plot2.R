#Converting Date Format
x = read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date = strptime(as.character(x$Date), "%d/%m/%Y")

#Cutting to specific dates only
y = subset(x, x$Date == "2007-02-02" | x$Date == "2007-02-01")

#Combining Date and Time and converting as POSIX
y$TimeStamp = as.POSIXct(paste(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")

#Time Series Plot
plot(y$TimeStamp, y$Global_active_power, type = "l", lty = 1, xlab = "", ylab = "Global Active Power (kilowatts)")


#Copying file to png file
dev.copy(png,"plot2.png")
dev.off()
