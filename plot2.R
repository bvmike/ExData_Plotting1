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

png("plot2.png", width=480, height=480, units="px")

plot(data$date_time, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()