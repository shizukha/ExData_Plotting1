plot3 <- function(){
		png(file = "plot3.png")
		
		# read data file
		data <- read.table("household_power_consumption.txt", sep = ";", nrow = 2880, skip = 66637)
		
		# add column headers
		colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
		
		# convert date and time columns into date/time classes in R
		data$Date <- as.Date(data$Date, "%d/%m/%Y")
		date <- data$Date
		time <- data$Time
		x <- paste(date, time)
		data$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
		
		
		# plot for each energy_sub_metering
		y <- data$Time
		x <- data$Sub_metering_1
		
		# plot an empty plot
		plot(y, x, type= 'n', ylab = "Energy Sub metering", xlab = "")
		
		# add point for energy_sub_metering1
		points(y, x, col="black", lwd = 1, type = "l")
		
		
		# add point for energy_sub_metering2
		x <- data$Sub_metering_2
		points(y, x, col="red", lwd = 1, type = "l")
		
		
		# add point for energy_sub_metering3
		x <- data$Sub_metering_3
		points(y, x, col="blue", lwd = 1, type = "l")
		
		# add legend
		legend("topright", lwd = 1, cex = 1.2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

		dev.off()



}
