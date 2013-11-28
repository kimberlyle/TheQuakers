# This file test on Leun's MDA model: W(M) = k * nu ^M
# Get all tau and v information for different nus

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

get_error_diagrams = function(time, magnitude, nus){
  result = list()
  for (i in nus){
    model = i ^ magnitude
    result[[paste('nu', i, sep = '')]] = get_error_diagram(time, model)  
  }
  return (result)
}

# Get all the earthquake error data under MDA model
data = read.csv("./DataFrame.csv")
data = data[data$magnitude>3,]

time = data$time
magnitude = data$magnitude
test_nu = seq(4, 8, 0.2)
result = get_error_diagrams(time, magnitude, test_nu)
save(result, file = './MDAModel.RData')
