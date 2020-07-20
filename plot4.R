data <- household_power_consumption

# subset function
data1 <- subset(data, Date == "1/2/2007")
data2 <- subset(data, Date == "2/2/2007")
newdata <- rbind(data1, data2)

newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(newdata, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})


dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()