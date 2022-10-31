## The following excercise contains two functions:
## - makeCacheMatrix(x) caches the inverse of a matrix object,
## - cacheSolve inverts and commits to cache.

## The following function uses a matrix as a parameter, and returns a special "matrix" object that caches its inverse.

makeCacheMatrix <- function(x = matrix()) {
        k <- NULL
        
##takes a matix, and sets it as the value to calculate the inverse of
        set <- function(y) {
                x <<- y
                k <<- NULL
}
## finds the value to calculate the inverse of
        get <- function() x
        
        
## caches the inverse of the matrix
      seti <- function(inverse) k <<- inverse
        
 ## gets the cached value of the matrix, or NULL if it hasn't been cached yet
      geti <- function() k
        
 ## return a list with all the functions in the object
        list(set = set, get =get, seti = seti, geti = geti)
        }


## This function takes makeCacheMatrix object and when ran the first time , calculates the inverser with 'solve',
##caches it, and returns it. When ran again it returns that cached vallue.
cacheSolve <- function(x, ...) {
        
## get the cached inverse from makeCacheMatrix
       inverse <- x$geti()
## if it's not NULL, return it with a message that it came from the cache
        if( !is.null(inverse)) {
                message("collecting cache data")
                return(inverse)
        }
## if we are here and it isn't cached, lets get it
        data <- x$get()
## calculate its inverse
        inverse <- solve(data)
## cache it!
        x$seti(inverse)
                
        ## Return it!
        inverse
        }
