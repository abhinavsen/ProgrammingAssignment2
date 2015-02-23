
makeCacheMatrix <- function(x = numeric()) {
  
 
  cache <- NULL
  
 
  setMatrix <- function(newValue) {
    x <<- newValue
   
    cache <<- NULL
  }
  
  # returns the stored matrix
  getMatrix <- function() {
    x
  }
  
 
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  
  getInverse <- function() {
    cache
  }
  

  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}



cacheSolve <- function(y, ...) {
  
  inverseM <- y$getInverse()
  
  if(!is.null(inverseM)) {
    message(" getting the cached data")
    return(inverseM)
  } 
 
  data <- y$getMatrix()
  inverseM <- solve(data)
  y$cacheInverse(inverseM)
  
 
  inverseM
}
