# read file into hhp and subset

hhp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")
hhp_sub <- subset(hhp, as.Date(hhp$Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")))

# parameter Global_active_power to plot

gap <- hhp_sub$Global_active_power
gap <- as.numeric(gap[gap != "?"])

# hist plot

png("plot1.png", width = 480, height = 480)
hist(gap, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
