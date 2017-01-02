source("load_data.R")
png(filename = "plot4.png", width = 480, height = 480,units = "px", bg = "transparent")
# Let's divide the plot in 4 = 2 * 2
par(mfrow = c(2, 2))
## Top-left plot
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## Top-right plot
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
## Bottom-right
plot(DateTime, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = colnames(workingData)[4])
dev.off()