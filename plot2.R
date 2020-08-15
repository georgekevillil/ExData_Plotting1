setwd("C:/Users/George Jose/Desktop/R projects/coursera/Exploratory data analysis/week 1/data/ExData_Plotting1")
data <- read.csv2(file = "household_power_consumption.txt", na.strings = "?")

##Subset the required dates
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#duplicating subdata
dup <- subdata
subdata$DateTime <- paste(subdata$Date,subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
plot(y = subdata$Global_active_power, x = subdata$DateTime, type = "l", ylab = "Global Active Power (killowatts)", xlab = "" )

dev.copy(png, file ="plot2.png")
dev.off()