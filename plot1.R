setwd("~/Documents/Coursera/Data Science Specialization/Course 4/Week 1")

data <- read.table("household_power_consumption.txt", header =  TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Time <- strftime(data$Time, "%H:%M:%S")

data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ]

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "red", ylim = range(0,1200) )
dev.off()
