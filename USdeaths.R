acData=diff(diff(USAccDeaths,12))

par(mfrow=c(2,1))

# obtain acf and pacf below
acf(acData)
pacf(acData)

sarima(USAccDeaths, 0,1,1,0,1,1,12)

model<- arima(x=USAccDeaths, order = c(0,1,1), seasonal = list(order=c(0,1,1), period=12))
pval<-Box.test(model$coef, lag=log(length(model$residuals)))
plot(USAccDeaths)
