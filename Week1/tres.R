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

#Third graph
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
#color and legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Making Copy
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()