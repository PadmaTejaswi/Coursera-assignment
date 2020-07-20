data <- household_power_consumption

# subset function
data1 <- subset(data, Date == "1/2/2007")
data2 <- subset(data, Date == "2/2/2007")
newdata <- rbind(data1, data2)

newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")
str(newdata)
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$datetime <- as.POSIXct(datetime)


plot(newdata$Global_active_power~newdata$datetime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
