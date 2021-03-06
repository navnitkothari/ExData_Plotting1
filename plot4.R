## Reading the extracted file
powerConsumption <- "./Data/household_power_consumption.txt"

## Reading the data using read.table
new_data <- read.table(powerConsumption, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")

## Selecting the data from particular dates
subset_data <- new_data[new_data$Date %in% c("1/2/2007","2/2/2007"), ]

## Converting the character variable into numeric
global_active_power <- as.numeric(subset_data$Global_active_power)
sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)

## Converting the Date and Time variables to Date/Time classes in R
date_and_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Dividing the frame into 4 parts to show 4 graphs
par(mfrow = c(2, 2))

## Plotting with appropriate labels
with(subset_data, {
    plot(date_and_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
    
    plot(date_and_time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    plot(date_and_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
    lines(date_and_time, sub_metering_2, type = "l", col = "Red")
    lines(date_and_time, sub_metering_3, type = "l", col = "Blue")
    legend("topright", col = c("Black", "Red", "Blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, cex = 0.75, bty = "n")
    
    plot(date_and_time, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
    
## Saving the output into a png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()