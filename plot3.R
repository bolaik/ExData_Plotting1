# read file into hhp and subset

hhp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
hhp_sub <- subset(hhp, as.Date(hhp$Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")))

# parameter to plot

dat <- strptime(paste(hhp_sub$Date, hhp_sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
sm1 <- hhp_sub$Sub_metering_1
sm2 <- hhp_sub$Sub_metering_2
sm3 <- hhp_sub$Sub_metering_3

png("plot3.png", width = 480, height = 480)
plot(dat, sm1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dat, sm2, col = "red")
lines(dat, sm3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()