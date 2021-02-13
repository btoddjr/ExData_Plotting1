#read the data file

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset the data by the date range

powerset <- subset(powerdata, powerdata$Date %in% c("1/2/2007", "2/2/2007"))

#create list of date/time combos from the subset data

combdatetime <- strptime(paste(powerset$Date, powerset$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#open the plot device

png("plot2.png", width = 480, height = 480)

#plot the chart

plot(combdatetime, as.numeric(powerset$Global_active_power), type = "l", main = "Global Active Power", xlab = "", ylab = "Global Active Power (kilowatts)")

#close the plot device

dev.off()
