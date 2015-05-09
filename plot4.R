Sys.setlocale("LC_ALL", "C")
d <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- d[d$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
d$Date <- strptime(paste(d$Date,d$Time),"%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
plot(d$Date,d$Global_active_power,ylab="Global Active Power",xlab=""
     ,type="l")
plot(d$Date,d$Voltage,ylab="Voltage",xlab="datetime"
     ,type="l")
plot(d$Date,d$Sub_metering_1,ylab="Energy sub metering",xlab=""
     ,type="n")
points(d$Date,d$Sub_metering_1,type="l",col="grey")
points(d$Date,d$Sub_metering_2,type="l",col="red")
points(d$Date,d$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(d$Date,d$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime"
     ,type="l")
dev.off()
