#Loading the data
data_full <- read.csv("C:/Users/ViviEscritorio/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#getting Dates
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#setting data from the dates 2007-02-01 and 2007-02-02
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#removing
rm(data_full)

#dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#first graph
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Making Copy
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
