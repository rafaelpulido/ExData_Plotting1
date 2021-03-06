setwd("~/Documents/Coursera/Data Science Specialization/Course 4/Week 1")

data <- read.table("household_power_consumption.txt", header =  TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Time <- strftime(data$Time, "%H:%M:%S")

data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

png("plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1, type ="l", ylim = range(0,40), col = "black", ylab = "Energy sub metering", xaxt = "n")
par(new = TRUE)
plot(data$Sub_metering_2, type ="l", ylim = range(0,40), col = "red", ylab = "", xaxt = "n")
par(new = TRUE)
plot(data$Sub_metering_3, type ="l", ylim = range(0,40), col = "blue", ylab = "", xaxt = "n")
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()