library(dplyr)
library(lubridate)

d <- tbl_df(read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE))

d <- d %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(Global_active_power_num = as.numeric(Global_active_power)) %>%
	mutate(Date = dmy_hms(paste(Date, Time)))

png("Plot2.png")

# Plot2
with(d, plot(Date, Global_active_power, type="l", ylab="Global active power (kilowatts)"))

dev.off()