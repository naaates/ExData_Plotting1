#Converting Date Format
x = read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date = strptime(as.character(x$Date), "%d/%m/%Y")

y = subset(x, x$Date == "2007-02-02" | x$Date == "2007-02-01")

GAP = y[3]
head(GAP)

#Transform dataframe to double
z = transform(GAP, Global_active_power = as.numeric(Global_active_power))
head(z)

#Plot histogram
hist(z$Global_active_power, main = paste("Global Active Power"), xlim= c(0,6) , xaxt="n",  xlab = "Global Active Power", col = "red")

#Change Axis Range
axis(side=1, at=c(0, 2, 4,6))

#Copying file to png file
dev.copy(png,"plot1.png")
dev.off()
