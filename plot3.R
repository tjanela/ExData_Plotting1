png("plot3.png")

plot(hpc$DateTime,
     hpc$Sub_metering_1,
     type="n",
     xlab = "",
     ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_1, col = "black")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), 
       lty=c(1,1,1))

dev.off()