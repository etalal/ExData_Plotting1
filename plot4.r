## read first 5 rows of the data set and get the class of each feature vector
top5 <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
classes <- sapply(top5,class)
## read the whole data set
df <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.string = "?",colClasses = classes)
##convert Date to class Date
df$Date <- as.Date(df$Date,format='%d/%m/%Y')
##subset of the data
df.subset <- subset(df,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df.subset$Time <- as.POSIXct(paste(df.subset$Date,df.subset$Time),format="%Y-%m-%d %H:%M:%S")

## create a png file of size 480x480
png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(df.subset$Time,df.subset$Global_active_power,ylab="Global Active Power",xlab="",type='l')
plot(df.subset$Time,df.subset$Voltage,ylab="Voltage",xlab="datetime",type='l')
plot(df.subset$Time,df.subset$Sub_metering_1,ylab="Energy sub metering",xlab="",type='l')
lines(df.subset$Time,df.subset$Sub_metering_2,type='l',col="red")
lines(df.subset$Time,df.subset$Sub_metering_3,type='l',col="blue")
legend("topright",legend=c("Sub metering_1","Sub metering_2","Sub metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
plot(df.subset$Time,df.subset$Global_reactive_power,ylab = "Global Reactive Power",xlab="datetime",type='l')
##close png device
dev.off() 