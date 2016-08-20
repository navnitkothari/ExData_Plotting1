## Reading the extracted file
powerConsumption <- "./Data/household_power_consumption.txt"

## Reading the data using read.table
new_data <- read.table(powerConsumption, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

## Selecting the data from particular dates
subset_data <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007"), ]

## Converting the character variable into numeric
global_active_power <- as.numeric(subset_data$Global_active_power)

## Converting the Date and Time variables to Date/Time classes in R
date_and_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Plotting with appropriate labels
plot(date_and_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Saving the output into a png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()