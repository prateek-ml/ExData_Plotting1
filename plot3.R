data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', na.strings = '?')

data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]

png(filename = 'plot3.png')

with(data, {
  plot(Sub_metering_1, type='l', xaxt='n', xlab = '', ylab = 'Energy sub metering')
  lines(x=Sub_metering_2, col='red')
  lines(x=Sub_metering_3, col='blue')
})

axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c('black', 'red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()