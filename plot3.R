## Extraer archivo de datos de febrero 1 y 2 de 2007 del archivo original 
## (Data File February 1 and 2, 2007. from original data file)

datos <- subset(read.csv("household_power_consumption.txt",header = TRUE,sep =";",na.strings="?"),
                Date == "2/2/2007"| Date=="1/2/2007")

## Extraer la columna Date y Time, unirlas y agregarlas al archivo de datos  
## (Extracting Date and Time column, join and add to the data file)

datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datos$Date), datos$Time)
datos$Datetime <- as.POSIXct(datetime)

## Gráfica a Pantalla (plot to window display)

with(datos, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub metering", xlab="",cex.lab=0.8)
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Grafica a archivo PNG (plot to a PNG file)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
