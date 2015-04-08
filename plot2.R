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
png(file="plot2.png", width=480, height=480, bg = "transparent")
par(mfrow=c(1,1))
plot(strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S"), my_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()