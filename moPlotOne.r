# Grab data 
myData <- read.table("household_power_consumption.txt", header=TRUE,colClasses = c(rep("character",2), rep("numeric",7)),sep=";",na="?")

# Read into dataframe - limit to desired dates, and convert the two character columns to Date and Time format
#goodDateRange <- myData[myData$Date %in% c("1/2/2007", "2/2/2007"),]
#goodDateRange <- transform(goodDateRange, Date=as.Date(Date, format="%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
# Does crunching to single line help or hinder readability? Efficiency?
goodDateRange <- transform(myData[myData$Date %in% c("1/2/2007", "2/2/2007"),], Date=as.Date(Date, format="%d/%m/%Y"), 
                           Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# Plot #1
hist(goodDateRange$Global_active_power, col="red",xlab="Global Active Power (Kilowatts)", ylab="Frequency", main=("Global Active Power"), breaks=12)
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()