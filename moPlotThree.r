# Grab data 
myData <- read.table("household_power_consumption.txt", header=TRUE,colClasses = c(rep("character",2), rep("numeric",7)),sep=";",na="?")

# Read into dataframe - limit to desired dates, and convert the two character columns to Date and Time format
goodDateRange <- transform(myData[myData$Date %in% c("1/2/2007", "2/2/2007"),], Date=as.Date(Date, format="%d/%m/%Y"), 
                           Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# Plot #3
# Using attach, cleans up script
attach(goodDateRange)

plot(Time, Sub_metering_1,ylab="Energy sub metering",xlab="", type="n")

lines(Time, Sub_metering_1,col="black")
lines(Time, Sub_metering_2,col="red")
lines(Time, Sub_metering_3,col="blue")

myLegend = legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(4,4,4),
       col=c("black","red","blue"), cex=.7, x.intersp=2, y.intersp = .2, pt.cex=1)


detach(goodDateRange)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()