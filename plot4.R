data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', na.strings = '?')

data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]

png(filename = 'plot4.png')

par(mfrow = c(2,2))

#1st subplot
plot(data$Global_active_power, type='l', xaxt='n', xlab='', ylab='Global Active Power')
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels = c('Thu', 'Fri', 'Sat'))

#2nd subplot
plot(data$Voltage, type='l', xaxt='n', xlab='datetime', ylab='Volatge')
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels = c('Thu', 'Fri', 'Sat'))

#3rd subplot
with(data, {
  plot(Sub_metering_1, type='l', xaxt='n', xlab='', ylab='Energy sub metering')
  lines(Sub_metering_2, col='red')
  lines(Sub_metering_3, col='blue')
})
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels = c('Thu', 'Fri', 'Sat'))
legend("topright", lty=1, col=c('black', 'red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th subplot
plot(data$Global_reactive_power, type='l', xaxt='n', xlab='datetime', ylab='Global Reactive Power')
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels = c('Thu', 'Fri', 'Sat'))

dev.off()

