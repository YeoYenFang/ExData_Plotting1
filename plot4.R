# Load Data
z <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                colClasses=c("character", "character", rep("numeric",7)),na="?")

# take data of required dates 
z1 <- subset(z, Date %in% c("1/2/2007","2/2/2007"))

# handle date and time
z1$Time <- strptime(paste(z1$Date, z1$Time), "%d/%m/%Y %H:%M:%S")
z1$Date <- as.Date(z1$Date, "%d/%m/%Y")

# Make Plot-4

png(file="plot4.png", width=400, height=400)

# to display the graphs 2 rows by 2 columns
par(mfrow=c(2,2))

#first graph
plot(z1$Time, z1$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

#second graph
plot(z1$Time, z1$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")


# third graph
plot(z1$Time, z1$Sub_metering_1, 
     xlab="", 
     ylab="Energy sub metering", 
     type="l")
lines(z1$Time, z1$Sub_metering_2, col="red")
lines(z1$Time, z1$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0,
       cex=0.7)

# forth graph
plot(z1$Time, z1$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


dev.off()