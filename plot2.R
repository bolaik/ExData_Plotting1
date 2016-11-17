# read file into hhp and subset

hhp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
hhp_sub <- subset(hhp, as.Date(hhp$Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")))
hhp_sub <- hhp_sub[hhp_sub$Global_active_power != "?" & hhp_sub$Date != "?", ]

# parameter Global_active_power to plot

gap <- hhp_sub$Global_active_power
dat <- strptime(paste(hhp_sub$Date, hhp_sub$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(dat, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

