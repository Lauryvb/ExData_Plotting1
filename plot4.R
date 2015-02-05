# fourth plot

## reading in the data
data2 <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', 
                    colClasses= 'character')
data_needed <- subset(data2, data2$Date == '1/2/2007' | data2$Date == '2/2/2007')
data_needed[, 3:9] <- sapply(data_needed[, 3:9], as.numeric)
data_needed$Time<- strptime(paste(data_needed$Date, data_needed$Time),  format = "%d/%m/%Y %H:%M:%S")
data_needed$Date = as.Date(data_needed$Date, format = "%d/%m/%Y")


## making the plot
par(mfrow= c(2,2), mar = c(2,2,2,2))

#plot1
plot(data_needed$Time, data_needed$Global_active_power, type = 'l', main = ' ', 
     xlab = ' ', ylab = 'Global active power (killowatts)')

#plot2
plot(data_needed$Time, data_needed$Voltage, type = 'l', main = ' ', 
     xlab = ' datetime', ylab = 'Voltage')

#plot3
plot(data_needed$Time,data_needed$Sub_metering_1,  type = 'l', xlab = ' ',
     ylab= 'Energy sub meeting' , main = ' ')
lines(data_needed$Time,data_needed$Sub_metering_2, col = 'red')
lines(data_needed$Time,data_needed$Sub_metering_3, col = 'blue')

legend('topright', lty= c(1,1,1), col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3' ),
       bty = 'n', cex = 0.6)

#plot4
plot(data_needed$Time, data_needed$Global_reactive_power, type = 'l', main = ' ', 
     xlab = 'datetime ', ylab = 'Global_reactive_power')


## saving the plot
dev.copy(png, 'plot6.png')
dev.off()



