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

## 3.Making Plot 1

hist(d1$Global_active_power, col="Red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

## 4.Saving to file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()