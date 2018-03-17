library(dplyr)
library(lubridate)

# In order to plot the line graph we need to account for the Time part.
# For convenience we create a new DateTime using the Date from Date and the Time
# from Time

hpc <- mutate(hpc, DateTime = make_datetime(year = year(Date), 
                                            month = month(Date), 
                                            day = day(Date), 
                                            hour = hour(Time), 
                                            min = minute(Time), 
                                            sec = second(Time), 
                                            tz = "UTC"))


png("plot2.png")

plot(hpc$DateTime,
     hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()