## Put comments here that give an overall description of what your functions do
## The overall goal of my two functions is to cahce a result in order to save
## save computing time for finding the inverse of a matrix.
## The first funciton assigns the variables and creates the cache.
## The second variable first checks to see if the calculation has been cached, if not
## it performs the calculation.

## This function assigns sets a value for the matrix, sets the solution for the inversion 
## and then gets the inversion

makeCacheMatrix <- function(x = matrix()) {
  m <- matrix()
  
  set <- function(y){
    x<<-y
    m<<- matrix()
  }
  
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = setsolve)
}


## This function performs the caluation of the inversion of the matrix
## Yet it firsts checks to see if the calculation has already been made

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
