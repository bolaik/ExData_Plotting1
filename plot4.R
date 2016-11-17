# read file into hhp and subset

hhp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
hhp_sub <- subset(hhp, as.Date(hhp$Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")))

# make png plots

dat <- strptime(paste(hhp_sub$Date, hhp_sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(dat, hhp_sub$Global_active_power, type = "l", xlab = "", ylab  ="Global Active Power")
plot(dat, hhp_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dat, hhp_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dat, hhp_sub$Sub_metering_2, col = "red")
lines(dat, hhp_sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(dat, hhp_sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()