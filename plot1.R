library(utils)
library(dplyr)

# Download the data zip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "household_power_consumption.zip")

# Unzip it to current directory
unzip("household_power_consumption.zip")

# Enable a custom format for parsing the date 
setAs ("character", 
       "hpcDate", 
       function(from) as.Date(from, format = "%d/%m/%Y"))

# Enable a custom format for parsing the time 
setAs ("character",
       "hpcTime", 
       function(from) as.POSIXct(strptime(from, "%H:%M:%S")))   

# Define colClasses to speed up the import using the custom formats defined above
colClasses <- c ("hpcDate", "hpcTime", 
                 "numeric", "numeric", 
                 "numeric", "numeric", 
                 "numeric", "numeric", 
                 "numeric") 
colNames <- c ("Date", "Time", 
                 "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", 
                 "Sub_metering_1", "Sub_metering_2", 
                 "Sub_metering_3") 

# Read the data set with the substituting '?'s with NAs
# Note that we are loading only the necessary rows
hpc <- read.csv("household_power_consumption.txt",
                sep = ";",
                na.strings = c("?"), 
                colClasses = colClasses,
                col.names = colNames,
                skip = 66637,
                nrows = 69517 - 66637,
                header = FALSE)

png("plot1.png")

hist(hpc$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red", 
     main = "Global Active Power")

dev.off()