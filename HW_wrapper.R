# This a wrapper function on HoltWinters method for predicting timeseries data


predict_new_data <- function(data,startPeriod,startFrequency=1,frequency="monthly",predictPeriod=3, explain = F){
  frequency.no <- 12
  first.char <- tolower(strtrim(frequency,1))
  if(first.char == "q"){ # quarterly data
    frequency.no <- 4
  }else if(first.char == "d") {# daily data
    frequency.no <- 7
  }
  data.ts <- ts(data=data,start=c(startPeriod,startFrequency),frequency=frequency.no)
  data.hw <- HoltWinters(data.ts)
  predict.hw <- predict(data.hw,n.ahead=predictPeriod)
  if(explain){
    print(data.hw)
    plot(decompose(data.ts))
    plot(data.hw,predict.hw)
    print(" ================= PREDICTED VALUES ==================")
  }
  #return(predict.hw) # this will return ts object
  return(as.data.frame(predict.hw))
}