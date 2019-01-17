data_vino<-read.csv("https://raw.githubusercontent.com/cesarhormazabal/powebi_r/master/data/winequality-white.csv",sep = ";")

View(data_vino)
summary(data_vino)

install.packages("caret")#metodos para analítica
install.packages("rpart")#modelos de arboles
install.packages("e1071")#otros modelos predictivos
install.packages("ranger")#modelos de bosques
install.packages("ggplot2")#visual

library("caret")
library("rpart")
library("e1071")
library("ranger")
library("ggplot2")


train_control<-trainControl(method="cv",number=5)
names(data_vino)
#Regresión lineal
regresion.lineal<-train(quality~.,data=data_vino,trControl=train_control,method="lm")

#Arbol
regresion.arbol<-train(quality~.,data=data_vino,trControl=train_control,method="rpart")

#Bosque
regresion.bosque<-ranger(quality~.,data=data_vino)
saveRDS(regresion.bosque,"bosque.rds")

