#Get data
library(data.table)
df <- fread("household_power_consumption.txt", na.strings=c("?"))
data <- df[(as.Date(df$Date, format="%d/%m/%Y") == '2007-02-01' | as.Date(df$Date, format="%d/%m/%Y") == '2007-02-02'), ]

#Plot1
plot.new()
png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "Red", main = "Global Active power", xlab = "Global Active power (kilowatts)")
dev.off()