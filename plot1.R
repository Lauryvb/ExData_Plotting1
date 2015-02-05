# first plot

## reading in the data
data2 <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', 
                    colClasses= 'character')
data_needed <- subset(data2, data2$Date == '1/2/2007' | data2$Date == '2/2/2007')
data_needed[, 3:9] <- sapply(data_needed[, 3:9], as.numeric)
data_needed$Time<- strptime(paste(data_needed$Date, data_needed$Time),  format = "%d/%m/%Y %H:%M:%S")
data_needed$Date = as.Date(data_needed$Date, format = "%d/%m/%Y")

## making the plot
hist(data_needed$Global_active_power, col = 'red', 
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

## saving the plot
dev.copy(png, 'plot1.png')
dev.off()