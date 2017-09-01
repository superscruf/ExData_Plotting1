# Grab data 
myData <- read.table("household_power_consumption.txt", header=TRUE,colClasses = c(rep("character",2), rep("numeric",7)),sep=";",na="?")

# Read into dataframe - limit to desired dates, and convert the two character columns to Date and Time format
goodDateRange <- transform(myData[myData$Date %in% c("1/2/2007", "2/2/2007"),], Date=as.Date(Date, format="%d/%m/%Y"), 
                           Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# Plot #4
# Using attach, cleans up script
#attach(goodDateRange)
par(mfrow=c(2,2))

with(goodDateRange, {
# Copy plot #2 - upper left quadrant
# using "with" instead of attach/detach. Not sure I like the non-functional warning. Not sure it matters.... yet.
plot(Time, Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="", type="n")
lines(Time, Global_active_power)

# Volts vs. datetime - upper right quadrant
plot(Time, Voltage,ylab="Voltage", xlab="", type="n")
lines(Time, Voltage)

# Copy plot 3 - lower left quadrant. No border around legend.
plot(Time, Sub_metering_1,ylab="Energy sub metering",xlab="", type="n")

lines(Time, Sub_metering_1,col="black")
lines(Time, Sub_metering_2,col="red")
lines(Time, Sub_metering_3,col="blue")

# Never did use "myLegend="
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       y.intersp=.4, cex=.8, bty="n", inset=.01);

# Global_reactive_power vs datetime - lower right quadrant
plot(Time, Global_reactive_power, ylab="Global_reactive_power",xlab="", type="n")
lines(Time, Global_reactive_power)

}) # Closes "with(goodDateRange, {" clause
#detach(goodDateRange)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()