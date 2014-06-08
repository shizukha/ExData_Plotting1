plot4 <- function(){
		png(file = "plot4.png")
		
		# read data file
		data <- read.table("household_power_consumption.txt", sep = ";", nrow = 2880, skip = 66637)
		
		# add column headers
		colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
		
		# convet date and time columns into date/time classes in R
		data$Date <- as.Date(data$Date, "%d/%m/%Y")
		date <- data$Date
		time <- data$Time
		x <- paste(date, time)
		data$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
		
		# divide the canvas into 2 columns and 2 rows
		par(mfcol = c(2,2))
		
		#1 : plot 1st graph
		plot(data$Time, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power")		

		
		#2 : plot 2nd graph
		y <- data$Time
		x <- data$Sub_metering_1
		plot(y, x, type= 'n', ylab = "Energy Sub metering", xlab = "")
		points(y, x, col="black", lwd = 1, type = "l")
		x <- data$Sub_metering_2
		points(y, x, col="red", lwd = 1, type = "l")
		x <- data$Sub_metering_3
		points(y, x, col="blue", lwd = 1, type = "l")
		legend("topright", lwd = 1, bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


		#3 : plot 3rd graph
		y <- data$Voltage
		x <- data$Time
		plot(x, y, xlab= "datetime", ylab= "Voltage", type = "l")


		#4 : plot 4th graph
		y <- data$Global_reactive_power
		plot(x, y, xlab= "datetime", ylab= "Global_reactive_power", type = "l")		

		dev.off()


}
