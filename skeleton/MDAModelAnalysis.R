# Analysis on the models
# The goodness of fit depend on what range of tau we use

load("./MDAModel.RData")

get_error_area = function(result, leftBound = max(sapply(result, function(x){min(x$taus)})), rightBound = min(sapply(result, function(x){max(x$taus)}))){
  maxmin = max(sapply(result, function(x){min(x$taus)}))
  minmax = min(sapply(result, function(x){max(x$taus)}))
  if (leftBound < maxmin || rightBound > minmax) stop(paste('The minimum leftBound is: ', maxmin, '; The maximum rightBound is: ', minmax, sep=''))  
  errs = sapply(result, function(x){integrate.xy(x$taus, x$vs, a = leftBound, b = rightBound)})
  return (errs)
}

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

min1 = which(errs == min(errs))
min2 = which(errs2 == min(errs2))
min3 = which(errs3 == min(errs3))
min4 = which(errs4 == min(errs4))
min5 = which(errs5 == min(errs5))
min6 = which(errs6 == min(errs6))

png(file = "./errorDiagram1.png", 480, 320)
plot(result$nu5.4$taus, result$nu5.4$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 5.4', xlab = 'tau', ylab = 'v')
dev.off()

png(file = "./errorDiagram2.png", 480, 320)
plot(result$nu5.8$taus, result$nu5.8$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 5.8', xlab = 'tau', ylab = 'v', col = 'red')
dev.off()

png(file = "./errorDiagram3.png", 480, 320)
plot(result$nu6.4$taus, result$nu6.4$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 6.4', xlab = 'tau', ylab = 'v', col = 'blue')
dev.off()

png(file = "./errorDiagram4.png", 480, 320)
plot(result$nu6.8$taus, result$nu6.8$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 6.8', xlab = 'tau', ylab = 'v', col = 'yellow')
dev.off()

png(file = "./errorDiagram5.png", 480, 320)
plot(result$nu7$taus, result$nu7$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 7', xlab = 'tau', ylab = 'v', col = 'green')
dev.off()

png(file = "./errorDiagram6.png", 480, 320)
plot(result$nu7.8$taus, result$nu7.8$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 7.8', xlab = 'tau', ylab = 'v', col = 'purple')
dev.off()
