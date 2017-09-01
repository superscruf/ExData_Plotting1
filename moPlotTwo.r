# Grab data 
myData <- read.table("household_power_consumption.txt", header=TRUE,colClasses = c(rep("character",2), rep("numeric",7)),sep=";",na="?")

# Read into dataframe - limit to desired dates, and convert the two character columns to Date and Time format
goodDateRange <- transform(myData[myData$Date %in% c("1/2/2007", "2/2/2007"),], Date=as.Date(Date, format="%d/%m/%Y"), 
                           Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# Plot #2
# using "with" instead of attach/detach. Not sure I like the non-functional warning. Not sure it matters.... yet.
with(goodDateRange, plot(Time, Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="", type="n"))
with(goodDateRange, lines(Time, Global_active_power))

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
