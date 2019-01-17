library(ggplot2)

data<-read.csv("https://raw.githubusercontent.com/cesarhormazabal/powebi_r/master/data/winequality-white.csv",sep = ";")
colnames(data)

ggplot(data,aes(x=alcohol,y=fixed.acidity))+
  geom_point(aes(col=pH,size=citric.acid))+
  geom_smooth()+
  facet_wrap(.~quality)+
  theme_bw()
gg

library(ggalt)

hist(data$residual.sugar)
data_alcoholicaydulce<-data[data$residual.sugar>15 & data$alcohol>12,]

gg<-ggplot(data,aes(x=alcohol,fixed.acidity))+
  geom_point(aes(col=pH,size=citric.acid))+
  geom_encircle(aes(x=alcohol,fixed.acidity), #ggalt
                data=data_alcoholicaydulce,
                color="red",
                size=2)
gg

library(ggExtra)

gg<-ggplot(data,aes(x=alcohol,y=log(residual.sugar)))+geom_count()+geom_smooth()

ggMarginal(gg,type="histogram",fill="transparent")
ggMarginal(gg,type="boxplot",fill="transparent")


library(ggcorrplot)

corr<-round(cor(data),1)
ggcorrplot(corr,hc.order=TRUE
           ,type="lower"
           ,lab=TRUE
           ,lab_size=3
           ,method="circle"
           ,colors = c("tomato2", "white", "springgreen3"),
           ggtheme = theme_bw())


g<-ggplot(data,aes(alcohol))
g+geom_density(aes(fill=factor(quality)),alpha=0.3)+
  theme_classic()

ggplot(data,aes(as.factor(quality),log(residual.sugar)))+geom_boxplot(vardwidth=T,fill="plum")+theme_classic()
