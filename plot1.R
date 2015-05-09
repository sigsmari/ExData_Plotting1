Sys.setlocale("LC_ALL", "C")
d <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- d[d$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
d$Global_active_power <- as.numeric(d$Global_active_power)
png("plot1.png")
hist(d$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
