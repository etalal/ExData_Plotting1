top5 <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
classes <- sapply(top5,class)
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string = "?",colClasses = classes)
df$Date <- as.Date(df$Date,format='%d/%m/%Y')
df.subset <- subset(df,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df.subset$Time <- as.POSIXct(paste(df.subset$Date,df.subset$Time),format="%Y-%m-%d %H:%M:%S")
plot(df.subset$Time,df.subset$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type='l')


plot(df.subset$Time,df.subset$Sub_metering_1,ylab="Energy sub metering",type='l')
lines(df.subset$Time,df.subset$Sub_metering_2,type='l',col="red")
lines(df.subset$Time,df.subset$Sub_metering_3,type='l',col="blue")
legend("topright",legend=c("Sub metering_1","sub metering_2","sub metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
