## Read text file seperating columns using ;. Then relabel the columns and finally create a dataset using only dates between the 1st and 2nd feburary 2007## read text file seperating columns using ;. Then relabel the columns and finally create a dataset using only dates between the 1st and 2nd feburary 2007
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
names(data) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Modify date to be used on x axis. 
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y") ## format the date to day/month/year
datetime <- paste(as.Date(data2$Date), data2$Time) ## create a variable with date and time 
data2$datetime <- as.POSIXct(datetime) ## convert character string to data format. 


## Plot global active power data for all times in the two days
plot(data2$datetime, data2$Global_Active_Power,type="l", ylab="Global Active Power (kilowatts)", xlab = " ")

## Export to png via export in plot view

