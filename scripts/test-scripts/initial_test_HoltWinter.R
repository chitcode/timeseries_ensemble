# testing the basic HoltWinters Method on the sample data downloaded from datamarket.com

ecommerce.data <- read.csv(file="data/test-data/ecommerce-retail-sales.csv",header=T,sep=",")
head(ecommerce.data)
ecommerce.data <- ts(ecommerce.data,start=c(1999,4),frequency=4)
HoltWinters(ecommerce.data)
plot(ecommerce.data)
lines(HoltWinters(ecommerce.data)$fitted,col='red')

emplyment.data <- read.csv(file="data/test-data/wisconsin-employment-time-series.csv",header=T,sep=",")
head(emplyment.data)
emplyment.data <- ts(emplyment.data,start=1961,frequency=12)
plot(emplyment.data)
plot(HoltWinters(emplyment.data))