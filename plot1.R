data <- read.table('household_power_consumption.txt',header = TRUE, sep = ';', na.strings = '?')

data$Date = as.Date(data$Date, '%d/%m/%Y')

data = data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]

png(filename = 'plot1.png')
hist(data$Global_active_power, col = 'red', main='Global Active Power', xlab='Global Active Power')
dev.off()
