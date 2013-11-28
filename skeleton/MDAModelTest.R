library(sfsmisc)
source("./ErrorRateFunction.R")

get_error_diagram = function(time, model){
  vs = rep(0, 1000)
  taus = rep(0, 1000)
  k = 0.98 ^ (1:1000)
  for (i in 1:1000){
    window_size = k[i] * model
    result = get_error_rate(time, window_size)
    vs[i] = result$v
    taus[i] = result$tau
    if (i%%5 == 0){
      print(paste("get the first ", i, " results"))
    }
  } 
  return (list("vs" = vs, "taus" = taus))
}

data = read.csv("./DataFrame.csv")
data = data[data$magnitude>3,]

# k * nu ^M

time = data$time


result = list()
for (i in seq(4, 7, 0.5)){
  model = i ^ data$magnitude
  result[[as.character(i)]] = get_error_diagram(time, model)  
}



a = sapply(result, function(x){integrate.xy(x$taus, x$vs, a = 0.01, b = 0.5)})
plot(seq(4, 7, .5), a, cex = 0.5, pch = 19)