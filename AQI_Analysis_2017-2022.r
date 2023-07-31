# This program will analyze the trends of Air Quality Index (AQI) in Hyderabad city from the year 2017-2022
# This program consists of two functions "AQI Analysis" and "Pollutant Analysis" that helps the user in overall analysis of the air quality of Hyderabad city
# Defining a function "AQI Analysis" which will tell the user about the levels of all the pollutants present in the air as well as the AQI levels of the selected month of the year

aqi_analysis<-function(year, month){
writeLines("")
writeLines("")
writeLines("")
print(paste("The analysis of", month, year, "is: "))

data= read.csv("AQI Data Set.csv", header=TRUE)
writeLines("")
writeLines("")

pm10_levels= subset(data$PM10_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of PM10 in the air in the month of", month, "in the year", year,"is: ", pm10_levels, "micrograms/cubic metre"))
writeLines("")

SO2_levels= subset(data$SO2_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of SO2 in the air in the month of", month, "in the year", year, "is: ", SO2_levels, "micrograms/cubic metre"))
writeLines("")

NOx_levels= subset(data$Nox_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of NOx in the air in the month of", month, "in the year", year, "is: ", NOx_levels, "micrograms/cubic metre"))
writeLines("")

PM2.5_levels= subset(data$PM2.5_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of PM2.5 in the air in the month of", month, "in the year", year, "is: ", PM2.5_levels, "micrograms/cubic metre"))
writeLines("")

Ammonia_levels= subset(data$Ammonia_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of Ammonia in the air in the month of", month, "in the year", year, "is: ", Ammonia_levels, "micrograms/cubic metre"))
writeLines("")

Ozone_levels= subset(data$Ozone_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of Ozone in the air in the month of", month, "in the year", year, "is: ", Ozone_levels, "micrograms/cubic metre"))
writeLines("")

CO_levels= subset(data$CO_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of CO in the air in the month of", month, "in the year", year, "is: ", CO_levels, "micrograms/cubic metre"))
writeLines("")

Benzene_levels= subset(data$Benzene_Levels, (data$Month==month & data$Year==year))
print(paste("The levels of Benzene in the air in the month of", month, "in the year", year, "is: ", Benzene_levels, "micrograms/cubic metre"))
writeLines("")

AQI_level= subset(data$AQI, (data$Month==month & data$Year==year))
print(paste("The AQI Level of the air in the month of", month, "in the year", year, "is: ", AQI_level ))
writeLines("")
}

# Defining a function "Pollutant Analysis" which will analyze the trends in the levels of the user defined pollutant over the years 2017-2022
pollutant_analysis<-function(pollutant){
data= read.csv("AQI Data Set.csv", header=TRUE)
poll_levels<-c(data[ , pollutant])

years<-c(data[ ,3])

months<-c(data[ ,2])

print(paste("The levels of the selected pollutant (in micrograms/cubic metre) over the years 2017-2022 are:"))
writeLines("")

df<-data.frame(months, years, poll_levels)
print(df)
writeLines("")

plot(years, poll_levels, xlab="Years (2017-2022)", ylab="Levels of the selected pollutant (in micrograms/cubic metre)", main="TREND IN THE LEVELS OF THE SELECTED POLLUTANT IN HYDERABAD CITY OVER THE YEARS 2017-2022", font.main=2, type="o", col="blue", pch=20, lwd=1)
}

# Main Menu of the program 
# This menu will take user input for the program
print(paste("Hello! and Welcome to the AQI Analytics of Hyderabad City between year 2017-2022"))

print(paste("Enter a year (in between 2017 to 2022) in which you want to see the analysis of AQI!"))
year<-readline()
writeLines("")
print(paste("The year you have entered is:", year))
writeLines("")

print(paste("Enter a month for which you want the analysis of AQI"))
month<-readline()
writeLines("")
print(paste("The month you have entered is:", month))
writeLines("")

print(paste("Choose a number to select a pollutant to analyze it's Five Years Trend in Hyderabad City:"))
print(paste("1. PM10"))
print(paste("2. SO2"))
print(paste("3. NOx"))
print(paste("4. PM2.5"))
print(paste("5. Ammonia"))
print(paste("6. Ozone"))
print(paste("7. CO"))
print(paste("8. Benzene"))
print(paste("Press a number between 1 to 8 to select a particular pollutant:"))
POLLUTANT<-readline()

if (POLLUTANT==1){
	print(paste("The pollutant you have selected is: PM10"))
	pollutant=4
}else if (POLLUTANT==2){
	print(paste("The pollutant you have selected is: SO2"))
	pollutant=5
}else if (POLLUTANT==3){
	print(paste("The pollutant you have selected is: NOx"))
	pollutant=6
}else if (POLLUTANT==4){
	print(paste("The pollutant you have selected is: PM2.5"))
	pollutant=7
}else if (POLLUTANT==5){
	print(paste("The pollutant you have selected is: Ammonia"))
	pollutant=8
}else if (POLLUTANT==6){
	print(paste("The pollutant you have selected is: Ozone"))
	pollutant=9
}else if (POLLUTANT==7){
	print(paste("The pollutant you have selected is: CO"))
	pollutant=10
}else if (POLLUTANT==8){
	print(paste("The pollutant you have selected is: Benzene"))
	pollutant=11
}else { print(paste("Please enter a correct number to see the Five Years Trend of the selected pollutant")) }

# These commands are passing on the variables to the functions defined above
aqi_analysis(year, month)
pollutant_analysis(pollutant)
