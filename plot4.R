## the script assumes that the input file "household_power_consumption.txt" is located in the
## working directory

big_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## select only required rows

library(dplyr)

data <- filter(big_data, (Date=='1/2/2007' | Date=='2/2/2007'))

## covert Date column into date type

data$Date <- as.Date(data$Date, "%d/%m/%Y")

## transform Date and Time variables into characters and merge them into one time type variable

data$date_time <- as.POSIXct(paste(as.character(data$Date),as.character(data$Time)))

## makink plot

png("plot4.png", width=480, height=480, units="px")

par(mfrow = c(2, 2))

plot(data$date_time, data$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

plot(data$date_time, data$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

plot(data$date_time, data$Sub_metering_1, type="l", ylab = "Energy sub mettering", xlab = "")
lines(data$date_time, data$Sub_metering_2, ylab = "", xlab = "", col="red")
lines(data$date_time, data$Sub_metering_3, ylab = "", xlab = "", col="blue")

legend("topright", col=c(1,2,4), legend=c("Sub_mettering_1", "Sub_mettering_2", "Sub_mettering_3"), lwd=1)

plot(data$date_time, data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()