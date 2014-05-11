setwd("C:/Data")

hpc = read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                 colClasses = "character", na.strings = "?")

hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

#Use data from the dates 2007-02-01 and 2007-02-02.
sub.hpc1 = subset(hpc, hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02')

#Note: Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

sub.hpc1$Global_active_power <- as.numeric(sub.hpc1$Global_active_power)

########################################################################################
sub.hpc1$TimeStamp <- as.POSIXct(paste(sub.hpc1$Date, sub.hpc1$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot2.png", bg="transparent", width = 480, height = 480)
plot(sub.hpc1$TimeStamp,sub.hpc1$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()
########################################################################################