## Read text file seperating columns using ;. Then relabel the columns and finally create a dataset using only dates between the 1st and 2nd feburary 2007## read text file seperating columns using ;. Then relabel the columns and finally create a dataset using only dates between the 1st and 2nd feburary 2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
names(data) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Modify date to be used on x axis. 
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$datetime <- as.POSIXct(datetime)

## Plot data
plot(data2$datetime, data2$Sub_metering_1,type= "l", xlab = " ", ylab="Energy Sub metering") ##Add first dataset calling the y axis energy sub metering
lines(data2$datetime, data2$Sub_metering_2,type= "l", col = "red") ##Add second dataset as a red line
lines(data2$datetime, data2$Sub_metering_3,type= "l", col = "blue") ## Add third dataset as a blue line

## Place a legend in the top right corner 
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3") )

## Export to png via export in plot view