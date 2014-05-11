setwd("C:/Data")

hpc = read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                 colClasses = "character", na.strings = "?")

hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

#Use data from the dates 2007-02-01 and 2007-02-02.
sub.hpc1 = subset(hpc, hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02')

#Note: Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

sub.hpc1$Global_active_power <- as.numeric(sub.hpc1$Global_active_power)

########################################################################################
png(file="plot4.png", bg="transparent", width = 480, height = 480)

par(mfrow=c(2,2))

with(sub.hpc1, {
    plot(TimeStamp,Global_active_power, type="l",ylab="Global Active Power",xlab="")
    plot(TimeStamp,Voltage, type="l",ylab="Voltage",xlab="datetime")
    
    plot(sub.hpc1$TimeStamp,sub.hpc1$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="", col="black")
    lines(sub.hpc1$TimeStamp,sub.hpc1$Sub_metering_2, col="red")
    lines(sub.hpc1$TimeStamp,sub.hpc1$Sub_metering_3, col="blue")
    legend("topright",lty=c(1,1), col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(TimeStamp,Global_reactive_power, type="l",xlab="datetime")
    
})

dev.off()
########################################################################################