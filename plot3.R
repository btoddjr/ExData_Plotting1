#read the data file

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data by the date range

powerset <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))

#create list of date/time combos from the subset data

combdatetime <- strptime(paste(powerset$Date, powerset$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#open the plot device

png("plot3.png", width = 480, height = 480)

#plot the chart

plot(combdatetime, as.numeric(powerset$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
lines(combdatetime, as.numeric(powerset$Sub_metering_2), type = "l", col = "red")
lines(combdatetime, as.numeric(powerset$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 3, col = c("black", "red", "blue"), bty = "n", cex = .8)

#close the plot device

dev.off()
