# Load Data
z <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                colClasses=c("character", "character", rep("numeric",7)),na="?")

# take data of required dates 
z1 <- subset(z, Date %in% c("1/2/2007","2/2/2007"))

# handle date and time
z1$Time <- strptime(paste(z1$Date, z1$Time), "%d/%m/%Y %H:%M:%S")
z1$Date <- as.Date(z1$Date, "%d/%m/%Y")

# Make Plot-2

png(file="plot2.png", width=400, height=400)

plot(z1$Time, z1$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
