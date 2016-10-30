## The following function makeCacheMatrix creates a matrix, that is really a list containing a function to set and get value of the matrix
## set and get the inverse of the matrix

}
makeCacheMatrix <- function(x = matrix()) {
mtx <- NULL
set <- function(y)
{
x <<- y
mtx <<- NULL
}
get <- function() x
setinverse <- function(inverse) mtx <<- inverse
getinverse <- function() mtx
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

 cacheSolve <- function(x, ...) {
## Returns a matrix that is the inverse of 'x'
mtx <- x$getinverse()
if(!is.null(mtx)) {
message("Cached data")
return(mtx)
}
data <- x$get()
mtx <- solve(data, ...)
x$setinverse(mtx)
mtx
}
