# testing the basic HoltWinters Method on the sample data downloaded from datamarket.com

ecommerce.data <- read.csv(file="data/test-data/ecommerce-retail-sales.csv",header=T,sep=",")
ecommerce.data <- na.omit(ecommerce.data)
head(ecommerce.data)
ecommerce.data <- ts(ecommerce.data[,2],start=c(1999,4),frequency=4)
ecom.hw <- HoltWinters(ecommerce.data)
plot(ecommerce.data)
plot(ecom.hw)
ecom.forecast <- predict(ecom.hw,newdata=48,prediction.interval=T,level=0.95)
plot(ecom.hw,ecom.forecast)

emplyment.data <- read.csv(file="data/test-data/wisconsin-employment-time-series.csv",header=T,sep=",")
head(emplyment.data)
emplyment.data <- ts(emplyment.data,start=1961,frequency=12)
plot(emplyment.data)
plot(HoltWinters(emplyment.data))