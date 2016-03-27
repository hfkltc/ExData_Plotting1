#Download and unzip the raw data into working directory
#clear global environment
rm(list = ls())
#set working directory
setwd("C:/Users/Fang-Ke/Dropbox/courses/DataScienceTool/ExploreData/Project 1")

#read household electric power consumption
consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2100000,
                          stringsAsFactors = FALSE,
                          na.strings = "?")
#subset data from 2007-02-01 and 2007-02-02
subset.data <- subset(consumption, Date == "1/2/2007" | Date == "2/2/2007")

#convert the Date and Time variables to Date/Time classes in R using the strptime()
date.time <- paste(subset.data$Date, subset.data$Time)
date.time <- strptime(date.time, "%d/%m/%Y %H:%M:%S")

#attaching Date/Time to subset.data
subset.data <- cbind(subset.data, date.time)

#make the plot3.png
png("plot3.png", width = 480, height = 480)
plot(subset.data$date.time, subset.data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(subset.data$date.time, subset.data$Sub_metering_1, col = "black")
lines(subset.data$date.time, subset.data$Sub_metering_2, col = "red")
lines(subset.data$date.time, subset.data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
