################ SERIES DE TIEMPO #####################
######################TEMPORAL######################### 
temporal <- tempfile()
download.file ("http://www.beta.inegi.org.mx/contenidos/proyectos/enchogares/regulares/enoe/microdatos/enoe_15ymas/2016/2016trim1_dbf.zip",temporal)
files = unzip(temporal, list=TRUE)$Name
unzip(temporal,files=files[grepl("dbf",files)])
install.packages("foreign")
require(foreign)
SDEMT116<- data.frame(read.dbf("sdemt116.dbf"))
#......................................................................................................................

View(SDEMT116) #Para ver las tablas guardadas 
nombres<-c("Sergio","Carlos","Paula") # Cadena de caracteres
nombres
edad<-c(23,43,51)
edad
base1<-data.frame(nombres,edad) # Data frame es una funcion que junta vectores para hacer una estructura de datos.
base1
View(base1) # la letra c "compagina" con funciones con mas de una entrada
#---> R tambien realiza operaciones aritmeticas
2+3

table(SDEMT116$SEX) # hacer una tabla de la variable sexo
# Con esta funcion podemos seprara las diferentes variables
table(SDEMT116$ENT) # Realizamos lo mismo con la variable entidad 
#el signo $ especifica la columna de la tabla a la que se va a contabilizar 

install.packages("questionr") # Descargar
require(questionr) #Leer la libreria
library(questionr)
wtd.table(SDEMT116$SEX,SDEMT116$FAC) #La funcion mencionada realiza ponderaciones 
wtd.table(SDEMT116$SEX, weights=SDEMT116$FAC)
