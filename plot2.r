## To run just execute source("plot2.r") after opening r where this file resides
source("prepare.r")
power_counsumption_data <- preprocessor()
png(filename = "plot2.png")
plot(power_counsumption_data$dateobj, power_counsumption_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()