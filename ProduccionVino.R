
modelo<-readRDS("C:/Users/Latitude 5280/Documents/Cursos/Power BI. R/bosque.rds")

data<-read.csv("https://raw.githubusercontent.com/cesarhormazabal/powebi_r/master/data/winequality-white.csv",sep = ";")

saveRDS(colnames(data),"nombres.rds")
readRDS("C:/Users/Latitude 5280/Documents/Cursos/Power BI. R/nombres.rds")


colnames(data)
prediccion<-predict(modelo,data)
data$predicciones<-prediccion$predictions
