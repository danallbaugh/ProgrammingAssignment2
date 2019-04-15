## Put comments here that give an overall description of what your
## functions do

## Takes function of a matrix as arguments and then stores the results and 
## calcuates an inverse.  Creates output as list to be called upon and manipulated
## by cachelSolve function or directly by subsetting.

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
}


## looks for the inverse matrix  in Cache and returns if stored.  If not, calculates and sets
## in cache and returns results.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
}
