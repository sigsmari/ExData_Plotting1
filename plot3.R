Sys.setlocale("LC_ALL", "C")
d <- read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- d[d$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
d$Date <- strptime(paste(d$Date,d$Time),"%Y-%m-%d %H:%M:%S")
plot(d$Date,d$Sub_metering_1,ylab="Energy sub metering",xlab=""
     ,type="n")
points(d$Date,d$Sub_metering_1,type="l",col="grey")
points(d$Date,d$Sub_metering_2,type="l",col="red")
points(d$Date,d$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()
