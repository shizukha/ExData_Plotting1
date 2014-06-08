plot2 <- function(){
		png(file = "plot2.png")
		data <- read.table("household_power_consumption.txt", sep = ";", nrow = 2880, skip = 66637)
		colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
		data$Date <- as.Date(data$Date, "%d/%m/%Y")
		date <- data$Date
		time <- data$Time
		x <- paste(date, time)
		data$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
		plot(data$Time, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (killowatts)")

		dev.off()



}