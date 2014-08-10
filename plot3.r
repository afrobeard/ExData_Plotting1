## To run just execute source("plot3.r") after opening r where this file resides
source("prepare.r")
power_counsumption_data <- preprocessor()
png(filename = "plot3.png")
plot(power_counsumption_data$dateobj, power_counsumption_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_counsumption_data$dateobj, power_counsumption_data$Sub_metering_2, type="l", col="red")
lines(power_counsumption_data$dateobj, power_counsumption_data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()