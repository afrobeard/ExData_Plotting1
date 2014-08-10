## To run just execute source("plot1.r") after opening r where this file resides
source("prepare.r")
power_counsumption_data <- preprocessor()
png(filename = "plot1.png")
hist(power_counsumption_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()