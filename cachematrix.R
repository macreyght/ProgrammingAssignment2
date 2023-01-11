## Put comments here that give an overall description of what your
## functions do

##changing the mean example function to do matrix inv instead of vector mean wasnt hard but I still have no complete understanding of what this thing is really doing

## Write a short comment describing this function

##create a list of 4 variables that are cached, set is a reset?, get is the matrix,  

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL ##inv in workenvironment starts being zero
  set <- function(y) {   ##creates x and inv in separate environment using <<- with values y and NULL or overrides any existing values for x and inv in separate environment
    x <<- y
    inv <<- NULL 
  }
  get <- function() x ##assignes matrix x from work environment to function named get
  setinverse <- function(inverse) inv <<- inverse ##overrides inv in seperate environment with (inverse), why?, was alreay set as y
  getinverse <- function() inv ##retrieves inv fom workenvironment, starts NULL
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function (see in function)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()  ## inv in workspace is now inv from the function getinverse (starts NULL) ?
  if(!is.null(inv)) {
    message("getting cached data") ##if cached inversed martix is there, return it
    return(inv)
  }
  data <- x$get()         ##else get matrix from cache and invert and overwrite inv in separate environment using setinverse, 
  inv <- solve(data, ...) 
  x$setinverse(inv)
  inv
}
