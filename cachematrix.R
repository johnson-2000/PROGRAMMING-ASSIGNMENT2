## Put comments here that give an overall description of what your
## functions do

## THIS FUNCTION CREATES A MATRIX OBJECT WHICH CAN CACHE ITS INVERSE
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL            
  set<-function(y){
                  x<<-y
                  inv<<-NULL
                   }
  get<-function()x             
  setinv<-function(inverse)inv<<-inverse
  getinv<-function(){ 
                    inver<-ginv(x)
                    inver%*%x           #function to get inverse of matrix
                    }
  list(set = set, get = get, 
       setinv = setinv, 
       getinv = getinv)
}


## Write a short comment describing this function
##Used for getting the cache data

cacheSolve <- function(x, ...)      
  {
  inv<-x$getinv()                  
  if(!is.null(inv)){                 
                     message("getting cached data!")
                     return(inv)                       
  }
  data<-x$get()
  inv<-solve(data,...)              
  x$setinv(inv)
  inv  
}
