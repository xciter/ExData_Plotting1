#download, unzip and read data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
my_data <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
unlink(temp)
#convert time
my_data$Date <- as.Date(strptime(my_data$Date, "%d/%m/%Y"))
#pick dates
my_data <- my_data[my_data$Date == "2007-02-01" | my_data$Date == "2007-02-02",]

#make plot
png(file="plot4.png", width=480, height=480, bg = "transparent")
par(mfrow=c(2,2))
plot(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Sub_metering_2, type="l",col="red")
lines(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Sub_metering_3, type="l",col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()