
## Extraer archivo de datos de febrero 1 y 2 de 2007 del archivo original 
## (Data File February 1 and 2, 2007 from original data file)

datos <- subset(read.csv("household_power_consumption.txt",header = TRUE,sep =";",na.strings="?"),
                Date == "2/2/2007"| Date=="1/2/2007")

## Histograma a Pantalla (Histogram to window display)

hist(datos$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")

## Histograma a archivo (Histogram to PNG file)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
