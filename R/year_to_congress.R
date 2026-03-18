#' Year to Congress
#'
#' Convert a calendar year to the corresponding Congress number.
#'
#' @param year A numeric year or vector of years (e.g., \code{2019}).
#' @return An integer value or vector of Congress numbers.
#' @examples
#' year_to_congress(2019)
#' # 116
#' year_to_congress(c(1987, 2007, 2019))
#' # 100 110 116
#' @export
year_to_congress <- function(year) {
  congress <- (year - 1789) / 2 + 1
  congress <- congress %/% 1
  return(congress)
}

