# This file test on Leun's MDA model: W(M) = k * nu ^M
# Get all tau and v information for different nus

source("./ErrorRateFunction.R")

# Function: get_error_diagram

# Input:
# time: time for each earthquake in days
# model: the winodw size without the scaling variable k
# Output: a list of taus and error rates for a specific model
get_error_diagram = function(time, model){
  
  # Initilize variables
  vs = rep(0, 1000)
  taus = rep(0, 1000)
  
  # A list of scaling variables to change window size, and thus the tau
  # This list of k ensures that tau and almost evenly distributed in range(0,1)
  k = 0.98 ^ (1:1000)
  
  # Get tau and error for each given k
  for (i in 1:1000){
    window_size = k[i] * model
    result = get_error_rate(time, window_size)
    vs[i] = result$v
    taus[i] = result$tau
    # These are here to ensure you the program is still running 
    if (i%%5 == 0){
      print(paste("get the first ", i, " results"))
    }
  } 
  
  # Return the result
  return (list("vs" = vs, "taus" = taus))
}


# Function: get_error_diagrams

# Input:
# time: time for each earthquake in days
# magnitude: the magnitude of corresponding earthquakes
# nus: a vector of different nus to try
# Output:  a list of lists of taus and error rates for different models
get_error_diagrams = function(time, magnitude, nus){
  result = list()
  for (i in nus){
    model = i ^ magnitude
    result[[paste('nu', i, sep = '')]] = get_error_diagram(time, model)  
  }
  return (result)
}


# Get data, and we filter out earthquakes with magnitude <= 3
data = read.csv("./DataFrame.csv")
data = data[data$magnitude>3,]

# run get_error_diagrams
time = data$time
magnitude = data$magnitude
test_nu = seq(4, 8, 0.2)
result = get_error_diagrams(time, magnitude, test_nu)

save(result, test_nu, time, magnitude, file = './MDAModel.RData')
