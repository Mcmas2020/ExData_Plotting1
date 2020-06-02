## Read text file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") ## Seperate columns using ; and remove ? to stop infinite error
names(data) <- c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ## Relabel the columns 
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007") ## Create a dataset using only dates between the 1st and 2nd feburary 2007

## Create a histogram of global active power by converting the string into a numeric. Label the title and x axis
hist(as.numeric(data2$Global_Active_Power), main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red")

## Create png file
png(filename = "plot_1.png", width = 480, height = 480)
dev.off()
