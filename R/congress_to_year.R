#' Congress to Year
#'
#' Convert a Congress number to the calendar year(s) of that session.
#' Returns either the first or second year of the two-year term.
#'
#' @param congress Congress number (integer). Accepts a single value or a vector.
#' @param year Which year of the term to return: \code{"first"} (default) or \code{"second"}.
#' @return A numeric value or vector of calendar years.
#' @examples
#' congress_to_year(116)
#' # 2019
#' congress_to_year(116, year = "second")
#' # 2020
#' congress_to_year(c(100, 110, 116))
#' # 1987 2007 2019
#' @export
congress_to_year <- function(congress, year = "first") {
  if (year == "first") {
    y <- 2 * (congress - 1) + 1789
  } else if (year == "second") {
    y <- 2 * (congress - 1) + 1790
  }
  return(y)
}


