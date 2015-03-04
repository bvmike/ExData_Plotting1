## the script assumes that the input file "household_power_consumption.txt" is located in the
## working directory

big_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## select only required rows

library(dplyr)

data <- filter(big_data, (Date=='1/2/2007' | Date=='2/2/2007'))

## covert Date column into date type

data$Date <- as.Date(data$Date, "%d/%m/%Y")

## makink plot

png("plot1.png", width=480, height=480, units="px")

hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()