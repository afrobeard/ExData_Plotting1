downloader <- function() {
    zipped_file_name = "household_power_consumption.zip"
    unzipped_file_name = "household_power_consumption.txt"
    download_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

    is_exists_zipped_file = file.exists(zipped_file_name)
    is_exists_unzipped_file = file.exists(unzipped_file_name)

    if(!is_exists_unzipped_file){
        print("Unzipped file not available for parsing. Checking zipped file existance")
        if(!is_exists_zipped_file){
            print("Zipped file not found preparing to download")
            download.file(download_url, destfile=zipped_file_name, method="curl")
        }
        else{
            print("Zipped file found")
        }
        print("Unzipping data")
        unzip(zipped_file_name)
    }
    print("Downloaded file available. Reading & Preparing data")
}

preprocessor <- function() {
    downloader()
    power_counsumption_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    power_counsumption_data <- power_counsumption_data[(power_counsumption_data$Date == "1/2/2007") | (power_counsumption_data$Date == "2/2/2007"),]
    power_counsumption_data$dateobj <- strptime(paste(power_counsumption_data$Date, power_counsumption_data$Time), "%d/%m/%Y %H:%M:%S")
    power_counsumption_data$wday <- strptime(power_counsumption_data$dateobj, "%d/%m/%Y %H:%M:%S")$wday
    power_counsumption_data
}
