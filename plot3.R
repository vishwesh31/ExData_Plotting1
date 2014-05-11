#####Reading data

temp <- tempfile()

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

data <- read.table(unzip(temp,"household_power_consumption.txt"),
                   header=TRUE,
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings="?", 
                   sep=";")

unlink(temp)

#####Convert to Date format

data$Date_Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#####Subset data for 2007-02-01 and 2007-02-02

data1 <- subset(data,as.Date(Date_Time) == as.Date("2007-02-01") |
                     as.Date(Date_Time) == as.Date("2007-02-02"))

#####Plot3

#####Open plot in png

png("D:/plot3.png") 

#####Creating plot

plot(data1$Date_Time, 
     data1$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering",
     cex.axis=0.75,cex.lab=0.75,cex.main=0.75)
lines(data1$Date_Time, data1$Sub_metering_1)
lines(data1$Date_Time, data1$Sub_metering_2, col='red')
lines(data1$Date_Time, data1$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
