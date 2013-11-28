library(sfsmisc)

# Function: get_error_area

# Input:
# result: A list of lists of taus and error rates for different models
# leftBound: the left bound for the area, default the maxmin tau of result 
# righttBound: the right bound for the area, default the minmax tau of result
# Output: a vector of error area for different models 
get_error_area = function(result, leftBound = NA, rightBound = NA ){

  # Get boundries
  maxmin = max(sapply(result, function(x){min(x$taus)}))
  minmax = min(sapply(result, function(x){max(x$taus)}))

  # Check if input is valid
  if (!(is.list(result) 
        && all(sapply(result, is.list))
        && !any(sapply(result, function(x){is.null(x$taus)}))
        && !any(sapply(result, function(x){is.null(x$vs)}))
        )) stop("result is of wrong format")
  if (is.na(leftBound)) leftBound = maxmin
  if (is.na(rightBound)) rightBound = minmax
  if (leftBound < maxmin || rightBound > minmax) stop(paste('The minimum leftBound is: ', maxmin, '; The maximum rightBound is: ', minmax, sep=''))  

  # Get errors
  errs = sapply(result, function(x){integrate.xy(x$taus, x$vs, a = leftBound, b = rightBound)})
  return (errs)
}
