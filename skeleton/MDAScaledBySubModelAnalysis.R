source('ErrorAreaFunction.R')
load("./MDAScaledBySubModel.RData")

errs = get_error_area(result_MDASub, 0.01)
plot(test_t, errs, cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau > 0.01")

errs = get_error_area(result_MDASub, 0.01, 1)
plot(test_t, errs, cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau > 0.01")

