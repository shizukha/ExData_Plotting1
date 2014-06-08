plot3 <- function(){
		png(file = "plot3.png")
		data <- read.table("household_power_consumption.txt", sep = ";", nrow = 2880, skip = 66637)
		colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
		data$Date <- as.Date(data$Date, "%d/%m/%Y")
		date <- data$Date
		time <- data$Time
		x <- paste(date, time)
		data$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
		y <- data$Time
		x <- data$Sub_metering_1
		plot(y, x, type= 'n', ylab = "Energy Sub metering", xlab = "")
		points(y, x, col="black", lwd = 1, type = "l")
		x <- data$Sub_metering_2
		points(y, x, col="red", lwd = 1, type = "l")
		x <- data$Sub_metering_3
		points(y, x, col="blue", lwd = 1, type = "l")
		legend("topright", lwd = 1, cex = 1.2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

		dev.off()



}