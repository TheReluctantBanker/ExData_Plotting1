
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

#plotting the  - plot 1 - this is a histogram

hist(subsetted.data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")


#saving the plot to png file
dev.copy(png,"plot1.png")
dev.off()