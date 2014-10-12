filepath="C:\\Users\\Sudha\\SUDHAS DOCUMENTS HERE\\COURSERA -COURSES\\2014\\DATA SCIENCE SPECIALIZATION\\exploratory data analysis\\project1"

#loading the dataset
household.data=read.table(file=file.path(filepath,"household_power_consumption.txt"),na.strings="?",sep=";",header=TRUE)

#inspecting the dataset
nrow(household.data)
ncol(household.data)
names(household.data)

#creating a datetime variable
household.data$datetime=as.POSIXct(paste(household.data$Date,household.data$Time),format="%d/%m/%Y %H:%M:%S")

#transforming date variable for use if required
household.data=transform(household.data,Date=as.Date(Date,"%d/%m/%Y"))

#transforming time varibale for use if required
household.data=transform(household.data,Time=as.POSIXct(strptime(Time,"%H:%M:%S")))

#subsetting the data
subsetted.data=subset(household.data,(household.data$Date==as.Date("2007-02-01") | household.data$Date ==as.Date("2007-02-02")) )

#making four plots - need a 2 by 2 plot window
par(mfrow=c(2,2))

#making the four plots one after the other

#plot 1
plot(subsetted.data$datetime,subsetted.data$Global_active_power, xlab="", ylab="Global Active Power",type="l")

#plot2
plot(subsetted.data$datetime,subsetted.data$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot3
plot(subsetted.data$datetime,subsetted.data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
points(subsetted.data$datetime,subsetted.data$Sub_metering_2,col="red",type="l")
points(subsetted.data$datetime,subsetted.data$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=1,bty="n")

#plot 4
plot(subsetted.data$datetime,subsetted.data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

#saving the plot to png device
dev.copy(png,file="plot4.png",res=50)
dev.off()
