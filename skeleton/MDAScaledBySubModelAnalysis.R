source('ErrorAreaFunction.R')
load("./MDAScaledBySubModel.RData")

errs = get_error_area(result_MDASub, 0.01)
plot(test_t_MDASub, errs, cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau > 0.01")

errs = get_error_area(result_MDASub, 0.01, 0.125)
plot(test_t_MDASub, errs, cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau > 0.01")


plot(result_MDASub$nu5.5t0$taus, result_MDASub$nu5.5t0$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 6.4', xlab = 'tau', ylab = 'v', col = 'blue')
lines(result_MDASub$nu5.5t0.5$taus, result_MDASub$nu5.5t0.5$vs, cex = 0.1, pch = 1, col = 'yellow')
plot(result_MDASub$nu5.5t1$taus, result_MDASub$nu5.5t1$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 6.4', xlab = 'tau', ylab = 'v', col = 'blue')
plot(result_MDASub$nu5.5t1.5$taus, result_MDASub$nu5.5t1.5$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 6.4', xlab = 'tau', ylab = 'v', col = 'blue')
lines(result_MDASub$nu5.5t2$taus, result_MDASub$nu5.5t2$vs, cex = 0.1, pch = 19, main = 'Error diagrams for nu = 6.4', xlab = 'tau', ylab = 'v', col = 'green')

