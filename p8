#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::::::::::::::::: SERIES DE TIEMPO :::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::27.02.2017:::::::::::::::::::::::::::::::::::::::::
# ESTO ES PARA EL MODELO ADITIVO

# ----> "DESCOMPOSICION CLASICA"
#       Se utiliza la funcion descompose, otro tipo de descomposicion de la estacionariedad.
#      tendencia y estacionariedad es la desomposicion por "Loess", la cual esta basada en algoritmos
#     que permite descomponer las series de tiempo en tres eleomenos:
#                                         --> estaciomnariedad
#                                         --> Tendencia
#                                         --> Aleatariedad
#     Una de las ventajas de esta descomposicion es el calculo de la estacionariedad que se obtienen 
#     valores de estacionariedad n constantes, en contraste con el metodo clasico de descomposicion

# -----> Descomposicion clasica
# Se utuliza la funcion descompose


desocupacion<- read.csv("C:\\Users\\Sala-D16\\Documents\\practica 1702\\Tarea2.csv")
View(desocupacion)
class(desocupacion)
des<-ts(desocupacion[1:48,1],frequency=(4),start=(2005))
class(des)
desco<-decompose(des)
tend1<-desco$trend
plot(tend1, col= "blue", main="tendencia desocupación ", ylab="tasas",xlab="años")

lines(tend2,col="Red")

# ----------> Descompoisicion tendencia, estacional por Loose 
#            Se utuliza la funcion "stl()"
#            Entonces para descomponer por Loose utilizamos 

desco2<-stl(des, s.window = "periodic", robust = T)
names(desco2)
desco2
desco$trend
tend2<- desco2$time.series[,2]
tend2
esta2<- desco2$time.series[,1]
esta2
# ----------------------------- EJERCICIO-----------------------------------------------
# -----------------------------BASE DEL PIB---------------------------------------------

pib<-read.csv("C:\\Users\\Sala-D16\\Desktop\\PIB México.csv")
class(pib)
pits<-ts(pib[1:35,1],frequency=(4),start=(2007))
pibds<-decompose(pits)
tend1<-pibds$trend
plot(tend1, col= "GREEN", main="MEXICAN PIB ", ylab="tasas",xlab="años")
lines(tend2,col="blue")

pits2<- stl(pits, s.window = "periodic",robust=T)
names(pits2)
pits2
tend2<-pits2$time.series[,2]
esta2<-pits2$time.series[,1]

install.packages("fpp")

require(fpp )
ajus<- seasadj(desco2)
#---> Ajustamos estacionalidad
inge1<-naive(ajus,h=4)
#h--> periodos que pronostica naive
plot(inge1)
inge1
