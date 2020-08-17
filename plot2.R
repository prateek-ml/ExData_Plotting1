data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', na.strings = '?')

data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]

png(filename='plot2.png')

plot(data$Global_active_power, type = 'l', xaxt = 'n', xlab='', ylab='Global Active Power (kilowatts)')
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels = c('Thu', 'Fri', 'Sat'))

dev.off()
