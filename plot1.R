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
#save subset data in csv format
write.csv(subset.data, "subset.data.csv", row.names = FALSE)

# plot plot1.png
png("plot1.png", width = 480, height = 480)
hist(subset.data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
