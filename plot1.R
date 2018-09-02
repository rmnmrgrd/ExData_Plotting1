library(dplyr)

d <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
d <- mutate(tbl_df(d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]), Global_active_power_num = as.numeric(Global_active_power))

png("Plot1.png")

# Plot 1
hist(d$Global_active_power_num, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
