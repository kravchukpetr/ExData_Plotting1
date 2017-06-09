
#Get data
library(data.table)
df <- fread("household_power_consumption.txt", na.strings=c("?"))
data <- df[(as.Date(df$Date, format="%d/%m/%Y") == '2007-02-01' | as.Date(df$Date, format="%d/%m/%Y") == '2007-02-02'), ]
data$dt <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time), format="%Y-%m-%d %H:%M:%S")
#Plot2
plot.new()
png(filename="plot2.png", width = 480, height = 480)
data$dt <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time), format="%Y-%m-%d %H:%M:%S")
plot(x = data$dt, y =  data$Global_active_power[!is.na(data$Global_active_power)], type = "l", xlab = "", ylab = "Global Active power (kilowatts)")
dev.off()