#Load the data.table library
library(data.table)
#Read the data from file into the data frame. Read only the lines pertaining to the data 1/2/2007 & 2/2/2007.
#Ignore the rest
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrows=2880, stringsAsFactors = FALSE)
#Set the column names
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                   "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Add a new column for date & time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Open the png graphic screen
png(filename = "plot3.png",width = 480, height = 480, units = "px")

#Draw the empty plot with all the labels
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
#Draw line plot for Sub metering 1
lines(data$DateTime, data$Sub_metering_1)
#Draw line plot for Sub metering 2
lines(data$DateTime, data$Sub_metering_2, col = "red")
#Draw line plot for Sub metering 3
lines(data$DateTime, data$Sub_metering_3, col = "blue")
#Draw legend
legend("topright", pch = "-", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd = "3")

#Close the graphics device
dev.off()