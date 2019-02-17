#' Year to Congress
#'
#' This function takes a year and returns the numerical value of the session of Congress during that year.
#' 
#' 
#' @param year the numerical value of the year for which you would like to know
#' @return a numeric value or vector of values of the Congress or Congresses which correspond the years
#' @export
year_to_congress <- function(year){
  c = (year - 1789)/2 + 1 
  c <- c %/% 1
  return(c)
}

