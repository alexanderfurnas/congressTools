#' Is Redistricting Congress
#'
#' Identify whether a Congress is the first to use new district lines drawn
#' after a decennial Census. Redistricting takes effect for the election
#' following a Census year (years ending in 0), so the new maps first apply
#' to the Congress that convenes in a year ending in 3
#' (e.g., the 108th Congress in 2003 after the 2000 Census).
#'
#' @param congress Congress number (integer). Accepts a single value or a vector.
#' @return A logical vector: \code{TRUE} if the Congress is the first under
#'   new district lines, \code{FALSE} otherwise.
#' @examples
#' is_redistricting_congress(108)
#' # TRUE  (2003–2005, first Congress after 2000 Census)
#'
#' is_redistricting_congress(116)
#' # FALSE
#'
#' is_redistricting_congress(103:118)
#' @export
is_redistricting_congress <- function(congress) {
  start_year <- 2 * (congress - 1) + 1789
  # New maps take effect in years ending in 3 (first election after Census year ending in 0)
  return(start_year %% 10 == 3)
}
