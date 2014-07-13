## Load the sqldf package
library("sqldf")

## Read only the data from 01/02/2007 to 02/02/2007
A <- read.csv.sql('household_power_consumption.txt',sep=";", header = TRUE, sql = 'select * from file where Date == "1/2/2007"');
B <- read.csv.sql('household_power_consumption.txt',sep=";", header = TRUE, sql = 'select * from file where Date == "2/2/2007"');

Combine <- rbind(A,B);  ## Row combine the required data

## Converts date and time using strptime
D <- strptime(paste(Combine[,1],Combine[,2]),"%d/%m/%Y %H:%M:%S");

## Plots the required histogram and saves to png format file with required pixel size
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(D, Combine[,'Sub_metering_1'],xlab ='', ylab = "Energy sub metering",col = "black", type = "l")
lines(D, Combine[,'Sub_metering_2'],col = "red", type = "l")
lines(D, Combine[,'Sub_metering_3'],col = "blue", type = "l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))
dev.off()
