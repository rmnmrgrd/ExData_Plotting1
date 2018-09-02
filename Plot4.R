library(dplyr)
library(lubridate)

d <- tbl_df(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE))

d <- d %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
	mutate(Sub_metering_2 = as.numeric(Sub_metering_2)) %>%
	mutate(Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
	mutate(Global_active_power = as.numeric(Global_active_power)) %>%
	mutate(Global_reactive_power = as.numeric(Global_reactive_power)) %>%
	mutate(Voltage = as.numeric(Voltage)) %>%

	mutate(Date = dmy_hms(paste(Date, Time)))

# Open file
png("Plot4.png")

# Plot4
par(mfrow=c(2,2))

# Subplot 1
with(d, plot(Date, Global_active_power, type="l", ylab="Global active power"), xlab="")

# Subplot 2
with(d, plot(Date, Voltage, type="l", ylab="Global active power", xlab="datetime"))


# Subplot 3
with(d, plot(Date, Sub_metering_1, type="o", lty=1, pch="", ylab="Energy sub metering", xlab=""))
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
legend("topright", legend=c("Submetering_1", "Submetering_2", "Submetering_3"), lty=1, col=c("black", "red", "blue"))


# Subplot 4
with(d, plot(Date, Global_reactive_power, type="l", ylab="Global reactive power", xlab="datetime"))

# Close plot
dev.off()