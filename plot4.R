#Get data
library(data.table)
df <- fread("household_power_consumption.txt", na.strings=c("?"))
data <- df[(as.Date(df$Date, format="%d/%m/%Y") == '2007-02-01' | as.Date(df$Date, format="%d/%m/%Y") == '2007-02-02'), ]
data$dt <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time), format="%Y-%m-%d %H:%M:%S")
#3
plot.new()
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x = data$dt, y =  data$Global_active_power[!is.na(data$Global_active_power)], type = "l", xlab = "", ylab = "Global Active power (kilowatts)")
plot(x = data$dt, y =  data$Voltage[!is.na(data$Voltage)], type = "l", xlab = "datetime", ylab = "Voltage")
plot(x = data$dt, y =  data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = data$dt, y =  data$Sub_metering_2, type = "l", xlab = "", col = "Red")
lines(x = data$dt, y =  data$Sub_metering_3, type = "l", xlab = "", col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
plot(x = data$dt, y =  data$Global_reactive_power[!is.na(data$Global_reactive_power)], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()