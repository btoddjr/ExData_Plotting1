#read the data file

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data by the date range

powerset <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))

#open the plot device

png("plot1.png", width = 480, height = 480)

#plot the histogram

hist(as.numeric(powerset$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#close the plot device

dev.off()
