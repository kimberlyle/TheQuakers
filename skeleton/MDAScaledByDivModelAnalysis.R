source('ErrorAreaFunction.R')
load("./MDAScaledByDivModel.RData")

errs = get_error_area(result_MDADiv, 0.01)
plot(test_nu_MDADiv, errs, cex = 0.5, pch = 19, type = 'b', main = "Area under ErrorDiagram for tau > 0.01")
