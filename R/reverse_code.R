#' Reverse Codes a variable
#' @param var a numeric vector to be reverse coded
#' @keywords data cleaning
#' @export
#' @examples 
#' my_variable <- c(1,2,2,3,3,1)
#' new_variable <- reverse_code (var=my_variable)
#' new_variable
#' @return a reverse coded vector
#' 
#' reverse_code()
reverse_code <- function(var){
  # error messages
  if(!is.numeric(var)) stop(paste0('var is ',class(var),', must be numeric'))
  if(!is.vector(var)) stop('var must be a vector')
  
  #initialize
  new <- vector()
  
  if(min(var, na.rm=T)==0){
    for(i in unique(var)){
      new[var==i] <- abs(i - max(var, na.rm=T))
    }
  }
  else if(min(var, na.rm=T)!=0){
    for(i in unique(var)){
      new[var==i] <- (max(var, na.rm=T) + 1) - i
    }
  }
return(new)
}