##These sets of functions cache the inverse of a matrix.

##This function creates an object called "matrix".


makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  set = function(y) {
    
    x <<- y
    inv <<- NULL
  }
  get = function() x
  setinv = function(inverse) inv <<- inverse 
  getinv = function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## This function computes the inverse of the special "matrix" returned by 
##makeCacheMatrix above. If the inverse has already been calculated 
##(and the matrix has not changed), then the cachesolve should retrieve 
##the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv = x$getinv()
  
  if (!is.null(inv)){

    message("getting cached data")
    return(inv)
  }
  
 
  mat.data = x$get()
  inv = solve(mat.data, ...)
  
  x$setinv(inv)
  
  return(inv)
}