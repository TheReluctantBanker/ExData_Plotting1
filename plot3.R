
#location of the file saved in variable called filepath
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

#plotting the  - plot 1 - this is a multiple line plot

hist(subsetted.data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")

plot(subsetted.data$datetime,subsetted.data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
points(subsetted.data$datetime,subsetted.data$Sub_metering_2,col="red",type="l")
points(subsetted.data$datetime,subsetted.data$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=1)


#saving the plot to png file
dev.copy(png,file="plot.png",res=50)
dev.off()
