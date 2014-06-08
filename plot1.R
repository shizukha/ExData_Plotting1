plot1 <- function(){
		
		png(file = "plot1.png")
		
		# read data file
		data <- read.table("household_power_consumption.txt", sep = ";", nrow = 2880, skip = 66637)
		
		# add column headers
		colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
		
		# histogram plot
		hist(data$Global_active_power, xlab="Global_active_power(killowatts)", col="red", main="Global Active Power")
		
		dev.off()

		

}
