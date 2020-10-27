#Examinación de la unidad 1, inserta el código para
#activar lo que se te indica. Guarda tu script y envíalo
#por classroom antes del martes.
#Importante: En caso de detectar plagio, se te anulará
#el apartado correspondiente.


#Vas a trabajar con la matriz de datos
#"millas" que se te proporciona a continuación.

millas<-datos::millas

#Realizar los siguientes pasos:


#1.- Explora la matriz de datos millas 
#valor: 5 puntos por comando correcto.
?millas
dim(millas)
names(millas)
str(millas)
anyNA(millas)
typeof(millas)
View(millas)
 

#2.- Determina las medidas estadísticas descriptivas
#y de variablidad
#Importante: no calcules los errores.
#Valor: 5 puntos por comando correcto.

millas_1<-as.data.frame(millas) #converti la matriz de datos a "data frame"

#inicia calculando los datos estadisticos descriptivos
summary(millas_1)
library(modeest)

#lafunción que utilizaremos para identificar la moda
#es mfv()
mfv(millas_1$fabricante)
mfv(millas_1$modelo)
mfv(millas_1$cilindrada)
mfv(millas_1$anio)
mfv(millas_1$transmision)
mfv(millas_1$cilindros)
mfv(millas_1$traccion)
mfv(millas_1$ciudad)
mfv(millas_1$autopista)
mfv(millas_1$combustible)
mfv(millas_1$clase)

#calculamos la varianza de cada una de las variables CUANTITATIVAS
var(millas_1$cilindrada)
var(millas_1$anio)
var(millas_1$cilindros)
var(millas_1$ciudad)
var(millas_1$autopista)

#calcularemosla desviacion standar para la
#variables cuantitativas
sd(millas_1$cilindrada)
sd(millas_1$anio)
sd(millas_1$cilindros)
sd(millas_1$ciudad)
sd(millas_1$autopista)


#coeficiente de variacion
#vamos a instalar el paquete FinCal y abrimos la librería
install.packages("FinCal")
library(FinCal)

#calculamos el coeficiente de variación
coefficient.variation(sd=sd(millas_1$cilindrada),
                      avg=mean(millas_1$cilindrada))
coefficient.variation(sd=sd(millas_1$anio),
                      avg=mean(millas_1$anio))
coefficient.variation(sd=sd(millas_1$cilindros),
                      avg=mean(millas_1$cilindros))
coefficient.variation(sd=sd(millas_1$ciudad),
                      avg=mean(millas_1$ciudad))
coefficient.variation(sd=sd(millas_1$autopista),
                      avg=mean(millas_1$autopista))


#3.- Construye:

#A) Un gráfico de dispersión con las variables cilindrada y autopista
#el color lo indica la variable clase. 
#Valor Total: 20 puntos
#(10 puntos por comando activado correcto).
#(10 punto por la generación del gráfico).

install.packages("tidyverse")
install.packages("RColorBrewer")

#Abrimos las librerias
library(tidyverse)
library(RColorBrewer)

#Diagrama de dispersión 1
dispersion_1<-ggplot(millas_1, aes(x=cilindrada, y=autopista, color=clase))+
  geom_point()

#visualizamos el gráfico
dispersion_1

#B) Un gráfico boxplot con las variables transmisión y ciudad
#El color lo indica la variable transmisión    
#El título del gráfico es Transmisión de autos en ciudad
#Coloca la etiqueta "Transmisión" en el eje x 
#Coloca la etiqueta "Ciudad" en el eje y 
#Valor Total: 20 puntos
#(10 puntos por comando activado correcto).
#(10 punto por la generación del gráfico del gráfico).

#BOXPLOT
boxplot<-ggplot(millas_1,aes(factor(transmision), 
                             ciudad, fill=transmision))+
  geom_boxplot()+
  ggtitle("transmicion de autos en ciudad")+
  xlab("transmision")+
  ylab("ciudad")

#visualizamos el gráfico
boxplot



#C) Un gráfico de barras para la variable "cilindros" 
#Valor Total: 20 puntos
#(10 puntos por comando activado correcto).
#(10 punto por la generación del gráfico).

#Grafico de Barras

#Construcción de la tabla con la que vamos a trabajar
attach(millas_1)
tabla_cilindros<-table(millas_1$cilindros)

#visualizamos la variable x que contiene la columna de Especies
tabla_cilindros

#Especificamos la paleta de colores que vamos a utilizar
color=c("aquamarine","cadetblue1","aquamarine3","cadetblue")

#Construimos el gráfico de la variable x
barplot(tabla_cilindros,xlab="cilindros", ylab="Frecuencias", 
        main="Gráfico de barras de cilindros", col=color)



