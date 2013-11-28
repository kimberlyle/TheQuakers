# This file test on Leun's MDA model: W(M) = k * nu ^M

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

get_error_area = function(result, leftBound = max(sapply(result, function(x){min(x$taus)})), rightBound = min(sapply(result, function(x){max(x$taus)}))){
  maxmin = max(sapply(result, function(x){min(x$taus)}))
  minmax = min(sapply(result, function(x){max(x$taus)}))
  if (leftBound < maxmin || rightBound > minmax) stop(paste('The minimum leftBound is: ', maxmin, '; The maximum rightBound is: ', minmax, sep=''))  
  errs = sapply(result, function(x){integrate.xy(x$taus, x$vs, a = leftBound, b = rightBound)})
  return (errs)
}

# Get all the earthquake error data under MDA model
data = read.csv("./DataFrame.csv")
data = data[data$magnitude>3,]

time = data$time
magnitude = data$magnitude
test_nu = seq(4, 8, 0.2)
result = get_error_diagrams(time, magnitude, test_nu)
save(result, file = './MDAModelTest.RData')

png(file = "./errs1.png", 480, 320)
errs = get_error_area(result, 0.01)
plot(test_nu, errs, cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau > 0.01")
dev.off()

png(file = "./errs2.png", 480, 320)
errs2 = get_error_area(result, 0.01, 0.75)
plot(test_nu, errs2, col = 'red', cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau (0.01, 0.75)")
dev.off()

png(file = "./errs3.png", 480, 320)
errs3 = get_error_area(result, 0.01, 0.5)
plot(test_nu, errs3, col = 'blue', cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau (0.01, 0.5)")
dev.off()

png(file = "./errs4.png", 480, 320)
errs4 = get_error_area(result, 0.01, 0.375)
plot(test_nu, errs4, col = 'yellow', cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau (0.01, 0.375)")
dev.off()

png(file = "./errs5.png", 480, 320)
errs5 = get_error_area(result, 0.01, 0.25)
plot(test_nu, errs5, col = 'green', cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau (0.01, 0.25)")
dev.off()

png(file = "./errs6.png", 480, 320)
errs6 = get_error_area(result, 0.01, 0.125)
plot(test_nu, errs6, col = 'purple', cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau (0.01, 0.125)")
dev.off()