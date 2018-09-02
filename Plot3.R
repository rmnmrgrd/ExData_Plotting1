library(dplyr)
library(lubridate)

d <- tbl_df(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE))

d <- d %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
	mutate(Sub_metering_2 = as.numeric(Sub_metering_2)) %>%
	mutate(Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
	mutate(Date = dmy_hms(paste(Date, Time)))

png("Plot3.png")

# Plot3
with(d, plot(Date, Sub_metering_1, type="o", lty=1, pch="", ylab="Energy sub metering", xlab=""))
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
legend("topright", legend=c("Submetering_1", "Submetering_2", "Submetering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()