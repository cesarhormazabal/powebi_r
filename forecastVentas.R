datosVentas<-read.csv("https://raw.githubusercontent.com/cesarhormazabal/powebi_r/master/data/ventas_publicidad.csv")

serie.ventas<-ts(datosVentas$Sales,start=c(1981,3),end=c(2005,12),frequency = 12)

plot(serie.ventas)

fit<-stl(serie.ventas, s.window="period")
x11()
plot(fit)
monthplot(serie.ventas)
library(forecast)
seasonplot(serie.ventas)

Acf(serie.ventas)

fit<-HoltWinters(serie.ventas)

plot(forecast(fit,36))

fit<-auto.arima(serie.ventas)

plot(forecast(fit,36))

