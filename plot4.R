png("plot4.png")

# Specify Multi Figure Row Wise
par(mfrow = c(2, 2))

plot(hpc$DateTime,
     hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(hpc$DateTime,
     hpc$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(hpc$DateTime,
     hpc$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(hpc$DateTime, hpc$Sub_metering_1, col = "black")

lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")

lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), 
       lty = c(1, 1, 1),
       bty = "n")

plot(hpc$DateTime,
     hpc$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()