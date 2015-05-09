Sys.setlocale("LC_ALL", "C")
d <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- d[d$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
d$Date <- strptime(paste(d$Date,d$Time),"%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(d$Date,d$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=""
     ,type="l")
dev.off()
