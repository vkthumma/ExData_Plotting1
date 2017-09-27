#Load the data.table library
library(data.table)
#Read the data from file into the data frame. Read only the lines pertaining to the data 1/2/2007 & 2/2/2007.
#Ignore the rest
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", 
                   skip = 66637, nrows=2880, stringsAsFactors = FALSE)
#Set the column names
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                   "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Open the png graphic screen
png(filename = "plot1.png",width = 480, height = 480, units = "px")

#Draw the histogram with all the labels and title
hist(data$Global_active_power, col = "red", breaks = 20, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
#Close the graphics device
dev.off()