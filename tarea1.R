# -------------------------------->Tarea <----------------------------
#DATE---> 6 Marzo 2017


#    *3 ejemplos graficas detectar tendencia, estacionalidad y ciclo 
#    * Analisar a que se debe cada una de los elementos 
#    *2000-2015 del PIB que bajamos en clase esta en la memoria
# tambien el word y scrip en una misma carpeta que se llame tarea 1
install.packages("wesanderson")
library(wesanderson)
require(ggplot2)
pib<-read.csv("/Users/zyanmctz/Desktop/PIB MEXICO TASA.csv")
pibst<-ts(pib1, frequency=12,start=2000, end = 2015)
pib1<-pib[,2]

#-----> *****Estacionaliedad, tendnecia ciclico*****
plot(window(pibst,start=2000,end=2015), ylab = "Tasa", xlab="A??o", main="TASA DEL PIB MEXICO 2000-2015",col= "blue")
qplot( x,y, data=pibst, geom = "line", shape="cut",ylab="Tasa",xlab="Periodo",main="TASA DEL PIB MEXICO 2000-2015")+geom_point(color="blue")


ggplot(pibst, aes(x="wt",y="mpg"))+geom_point(color="darkblue")

seasonplot(pibst,s=12, year.labels = TRUE, main = "TASA DEL PIB MEXICO 2000 2015",ylab = "Tasa",xlab="Mes",col = rainbow(25),
           year.labels.left = TRUE,pch=11)


