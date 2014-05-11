setwd("C:/Data")

setwd("C:/Users/js1/Documents/GitHub/ExData_Plotting1")

hpc = read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                 colClasses = "character", na.strings = "?")

hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")

#Use data from the dates 2007-02-01 and 2007-02-02.
sub.hpc1 = subset(hpc, hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02')

#Note: Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

sub.hpc1$Global_active_power <- as.numeric(sub.hpc1$Global_active_power)

########################################################################################
png(file="plot1.png", bg="transparent", width = 480, height = 480)

hist(sub.hpc1$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power" )

dev.off()
########################################################################################