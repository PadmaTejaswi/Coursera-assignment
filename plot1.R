data <- household_power_consumption
str(data)
data$Date <- as.Date.character(data$Date, format = c("%d/%m/%Y"))
str(data)

# subset function
data1 <- subset(data, Date=="2007-2-1")
data2 <- subset(data, Date=="2007-2-2")
newdata <- rbind(data1, data2)
str(newdata)

hist(newdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()