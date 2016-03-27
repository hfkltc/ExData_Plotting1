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

#make the plot2.png
png("plot2.png", width = 480, height = 480)
plot(subset.data$date.time, subset.data$Global_active_power, type = "n", xlab = "", 
     ylab = "Global Active Power (Kilowatts)")
lines(subset.data$date.time, subset.data$Global_active_power)
dev.off()
