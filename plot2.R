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

#####Plot2

#####Open plot in png

png("D:/plot2.png") #####Saving plot in png

#####Creating plot

plot(data1$Date_Time, 
     data1$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)",cex.axis=0.75,cex.lab=0.75,cex.main=0.75)
lines(data1$Date_Time, data1$Global_active_power)

#####Close png file

dev.off()

