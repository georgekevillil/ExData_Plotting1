setwd("C:/Users/George Jose/Desktop/R projects/coursera/Exploratory data analysis/week 1/data/ExData_Plotting1")
data <- read.csv2(file = "household_power_consumption.txt", na.strings = "?")

##Subset the required dates
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#duplicating subdata
dup <- subdata

subdata$DateTime <- paste(subdata$Date,subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

##Ploting
png("plot3.png", width=480, height=480)
plot(y = subdata$Sub_metering_1, x = subdata$DateTime, type = "l", ylab = "Energy submetering", xlab = "" )
lines(x = subdata$DateTime,subdata$Sub_metering_2,col = "red")
lines(y = subdata$Sub_metering_3, x = subdata$DateTime, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
