#' Congress to Date Range
#'
#' Return the start and end dates of a given Congress. Under the 20th Amendment
#' (ratified 1933), each Congress convenes at noon on January 3 of an odd-numbered
#' year and adjourns just before noon on January 3 two years later.
#'
#' @param congress Congress number (integer). Accepts a single value or a vector.
#' @return A data frame with columns \code{congress}, \code{start}, and \code{end}
#'   (both of class \code{Date}).
#' @examples
#' congress_to_date_range(116)
#' #   congress      start        end
#' # 1      116 2019-01-03 2021-01-03
#'
#' congress_to_date_range(c(116, 117))
#' @export
congress_to_date_range <- function(congress) {
  start_year <- 2 * (congress - 1) + 1789
  end_year <- start_year + 2
  data.frame(
    congress = congress,
    start = as.Date(paste0(start_year, "-01-03")),
    end = as.Date(paste0(end_year, "-01-03"))
  )
}
