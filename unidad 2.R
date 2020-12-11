data("pisaitems")
pisa<-pisaitems
 
#explorar matriz 
names(pisa)
typeof(pisa)
str(pisa)

#explorar valores perdidos 
anyNA(pisa)

#total de datos perdidos
sum(is.na(pisa))

#eliminacion de datos perdidos y nueva matriz
pisa2<-na.omit(pisa)

anyNA(pisa2)
head(pisa2)

names(pisa2)

items36<-pisa2[,43:47]
head(items36[1:5,1:5])

#renombrar las etiquetas de respuesta
levels(items36)<-c("nunca o casi nunca",
                   "en alguna lección",
                   "en la mayoría de lección",
                   "en toda la lección")

names(items36)<-c("los estudiantes no escuchan lo que dice el prefersor",
                  "hay ruido y desorden",
                  "el profesor tiene que esperar mucho tiempo para que los alumnos se calmen",
                  "los estudiantes no pueden trabajar bien ", 
                  "los estudiantes no comienzan a trabajar durante mucho tiempo despues de que comienza la sesion")

l36<-likert(items36)

#gráfico
plot(l36,type="bar",centered=FALSE)
