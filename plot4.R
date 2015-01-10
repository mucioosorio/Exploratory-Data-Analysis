## Extraer archivo de datos de febrero 1 y 2 de 2007 del archivo original 
## (Data File February 1 and 2, 2007 from original data file)

datos <- subset(read.csv("household_power_consumption.txt",header = TRUE,sep =";",na.strings="?"),
                Date == "2/2/2007"| Date=="1/2/2007")

## Extraer la columna Date y Time, unirlas y agregarlas al archivo de datos 
## (Extracting Date and Time column, join and add to the data file)

datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(datos$Date), datos$Time)
datos$Datetime <- as.POSIXct(datetime)

## Gráfica a Pantalla (plot to window display)

par(mfrow=c(2,2), oma=c(0,0,2,0))
with(datos, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="",cex.lab=.7)
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime",cex.lab=.7)
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="",cex.lab=.7)
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=.6)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_reactive_power",xlab="datetime",cex.lab=.7,cex.axis=.6)
})

## Grafica a archivo PNG (plot to a PNG file)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
