## Read text file seperating columns using ;. Then relabel the columns and finally create a dataset using only dates between the 1st and 2nd feburary 2007## read text file seperating columns using ;. Then relabel the columns and finally create a dataset using only dates between the 1st and 2nd feburary 2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
names(data) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Modify date to be used on x axis
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$datetime <- as.POSIXct(datetime)

## Plot data
par(mfcol=c(2,2), mar = c(4,4,2,1)) ##make 4 graphs filling the first column first. Change the bottom margin by 1 to fit the legend in without masking the data
   
plot(data2$datetime, data2$Global_Active_Power,type="l", ylab="Global Active Power (kilowatts)", xlab = " ")   ##1st graph
    
plot(data2$datetime, data2$Sub_metering_1,type= "l", xlab = " ", ylab="Energy Sub metering") ##Second graph including additional datasets and legend
lines(data2$datetime, data2$Sub_metering_2,type= "l", col = "red")
lines(data2$datetime, data2$Sub_metering_3,type= "l", col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3") )

plot(data2$datetime, data2$Voltage,type="l", ylab="Voltage", xlab = "datetime")  ## Add third plot voltage over time  

plot(data2$datetime, data2$Global_Reactive_Power,type="l", ylab="Greater Reactive Power (Kilowatts)", xlab = "datetime") ##Add fourth plot greater reactive power over time

## Create png file
png(filename = "plot_4.png", width = 480, height = 480)
dev.off()
