data <- household_power_consumption

# subset function
data1 <- subset(data, Date == "1/2/2007")
data2 <- subset(data, Date == "2/2/2007")
newdata <- rbind(data1, data2)

newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$datetime <- as.POSIXct(datetime)

plot(newdata$Sub_metering_1~newdata$datetime, type ="l", xlab = "", ylab = "Energy sub metering")
lines(newdata$Sub_metering_2~newdata$datetime, col = "red")
lines(newdata$Sub_metering_3~newdata$datetime, col = "blue")


legend("topright", c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 ")
       lwd = 2, col = c("black", "red", "blue"),)

dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()

