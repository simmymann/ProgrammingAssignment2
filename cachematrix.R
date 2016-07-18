## These functions cache the results of computations, and enable me to look up
## the computations instead of computing them again. 

## This function creates a special matrix object that can cache its inverse

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
## This funciton computes the inverse matrix returned by the make cache function. 

cacheSolve <- function(x, ...) {
	inv = x$getinv()
	if (!is.null(inv)){
		message("getting cached data")
		return(inv)
        ## Return a matrix that is the inverse of 'x'
	}
	mat.data = x$get()
	inv = solve(mat.data, ...)
	x$setinv(inv)
	return(inv)
}

