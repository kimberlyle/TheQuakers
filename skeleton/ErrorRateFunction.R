data = read.csv("~/stat157/TheQuakers/skeleton/DataFrame.csv")
names(data)
data1 = data[data$magnitude>=3,]
data2 = data[data$magnitude>=3.5,]
data3 = data[data$magnitude>4,]
data4 = data[data$magnitude>3,]

# k * nu ^M

data = data4
window_size = rep(2, nrow(data4))

get_error_rate = function(data, window_size){
  size = nrow(data)
  left_alarm = data$time
  right_alarm = data$time + window_size
  right_alarm[right_alarm>max(data$time)] = max(data$time)
  left_all = rep(0, size)
  right_all = rep(0, size)  
  left_curr = 0
  right_curr = 0
  predicted = rep(FALSE, size)  
  for (i in 1:size){
    if (left_alarm[i] > right_curr){
      left_all[i] = left_curr = left_alarm[i]
      right_all[i] = right_curr = right_alarm[i]
    } else if (right_alarm[i] > right_curr){
      left_all[i] = left_curr = right_curr
      right_all[i] = right_curr = right_alarm[i]
      predicted[i] = TRUE
    } else {
      predicted[i] = TRUE
    }
  }
  v = 1 - sum(predicted) / size
  tau = sum(right_all - left_all)/(max(data$time) - min(data$time))
  return (list('v' = v, 'tau' = tau))
}

taus = rep(0, 100)
vs = rep(0, 100)


for (i in 1:100){
  window_size = rep(i, nrow(data4))
  result = get_error_rate(data4, window_size)
  taus[i] = result$tau
  vs[i] = result$v  
}
plot(taus, vs, cex = 0.5, pch = 19)


for (i in 1:100){
  window_size = i * 1.5^data4$magnitude
  result = get_error_rate(data4, window_size)
  taus[i] = result$tau
  vs[i] = result$v  
}
plot(taus, vs, cex = 0.5, pch = 19, type = 'l')


for (i in 1:100){
  window_size = 0.05 * i*(1.1)^data4$magnitude
  result = get_error_rate(data4, window_size)
  taus[i] = result$tau
  vs[i] = result$v  
}
plot(taus, vs, cex = 0.5, pch = 19)