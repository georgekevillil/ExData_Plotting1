##setting the working directory
setwd("C:/Users/George Jose/Desktop/R projects/coursera/Exploratory data analysis/week 1/data")
data <- read.csv2(file = "household_power_consumption.txt", na.strings = "?")

##Subset the required dates
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png("plot1.png")
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red" )
dev.off()