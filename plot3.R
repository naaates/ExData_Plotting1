#Converting Date Format
x = read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date = strptime(as.character(x$Date), "%d/%m/%Y")

#Cutting to specific dates only
y = subset(x, x$Date == "2007-02-02" | x$Date == "2007-02-01")

#Combining Date and Time and converting as POSIX
y$TimeStamp = as.POSIXct(paste(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")

#Time Series Plot
plot(y$TimeStamp, y$Sub_metering_1, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering")
lines(y$TimeStamp, y$Sub_metering_2, col = "red")
lines(y$TimeStamp, y$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)

#Copying file to png file
dev.copy(png,"plot3.png")
dev.off()
