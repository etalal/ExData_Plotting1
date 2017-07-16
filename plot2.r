## read first 5 rows of the data set and get the class of each feature vector
top5 <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
classes <- sapply(top5,class)
## read the whole data set
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string = "?",colClasses = classes)
##convert Date to class Date
df$Date <- as.Date(df$Date,format='%d/%m/%Y')
##subset of the data for the date 2007-02-01 and 2007-02-02
df.subset <- subset(df,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df.subset$Time <- as.POSIXct(paste(df.subset$Date,df.subset$Time),format="%Y-%m-%d %H:%M:%S")
##create a png file of the size 480x480
png("plot2.png",width=480,height=480)
plot(df.subset$Time,df.subset$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type='l')
##close the png device
dev.off()