## Load the sqldf package
library("sqldf")

## Read only the data from 01/02/2007 to 02/02/2007
A <- read.csv.sql('household_power_consumption.txt',sep=";", header = TRUE, sql = 'select * from file where Date == "1/2/2007"');
B <- read.csv.sql('household_power_consumption.txt',sep=";", header = TRUE, sql = 'select * from file where Date == "2/2/2007"');

Combine <- rbind(A,B);  ## Row combine the required data

## Plots the required histogram and saves to png format file with required pixel size
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(Combine[,'Global_active_power'],main = "Global Acitve Power", xlab = "Global Active Power (kilowatts)",col = 2)
dev.off()

