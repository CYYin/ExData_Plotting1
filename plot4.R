## 1.Loading the data

setwd("F:/Coursera/Exploratory Data Analysis")
filein <- c("F:/Coursera/Exploratory Data Analysis/Week1/household_power_consumption.txt")
d0 <- read.table(filein,header = TRUE, sep = ";", na.strings = "?")
d1 <- d0[d0$Date %in% c("1/2/2007","2/2/2007") ,]
rm(d0)

## 2.Converting dates
datetime <- as.Date(d1$Date,"%d/%m/%Y")
datetime <- paste(datetime, d1$Time )
d1$Datetime <- strptime(datetime,"%Y-%m-%d %H:%M:%S")

## 3.Making Plot 4

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(d1, {
  plot(d1$Datetime, d1$Global_active_power,type="l",ylab="Global Active Power", xlab="")
  plot(d1$Datetime, d1$Voltage,  type="l", ylab="Voltage", xlab="datetime")
  plot(d1$Datetime, d1$Sub_metering_1,type="l", ylab="energy sub-metering", xlab="")
  lines(d1$Datetime, d1$Sub_metering_2, col = "red")
  lines(d1$Datetime, d1$Sub_metering_3, col = "blue")
  legend("topright", lty = 1,bty="n", cex = 0.5, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(d1$Datetime, d1$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
}
)

## 4.Saving to file

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()