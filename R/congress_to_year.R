#' Congress to Year
#'
#' This function takes the number of a Congress and returns the years that Congress was in session. 
#' It will return either the first or second year of the session of Congress.
#' 
#' 
#' @param congress the numerical signifier for congress. Either a single value of a vector of values.
#' @param year Which year of the Congress to return. Rakes either 'first' or 'second', defaults to "first" 
#' @return a numeric value or vector of values of the years which correspond the Congress
#' @export

congress_to_year <- function(congress, year = "first"){
  if (year == "first"){
    y <- 2*(congress-1) + 1789 
  }  else if (year == "second") {
    y <- 2*(congress-1) + 1790 
  }
  return(y)
}


