#' Standardize District
#'
#' Normalize congressional district identifiers to a consistent format
#' (e.g., \code{"CA-01"}). Accepts either a combined district string or
#' separate state and district arguments.
#'
#' @param full_district A district string or vector of district strings
#'   (e.g., \code{"CA12"}, \code{"CA-12"}). If provided, \code{state} and
#'   \code{district} are ignored.
#' @param state State abbreviation or vector of state abbreviations.
#' @param district District number or vector of district numbers.
#' @param denote_sen String used to represent Senate seats. Defaults to \code{"00"}.
#' @param denote_al String used to represent at-large districts. Defaults to \code{"01"}.
#' @param sep Separator for the output format. Also used to split input districts
#'   unless \code{old_sep} is specified. Defaults to \code{"-"}.
#' @param old_sep Separator to split input districts on. Overrides \code{sep} for parsing.
#' @param sep_loc Character position at which to split state from district when
#'   the input has no separator (e.g., \code{2} for \code{"CA12"}).
#' @return A character vector of standardized district identifiers.
#' @examples
#' stdz_district(full_district = c("CA-12", "NY-al"))
#' # "CA-12" "NY-01"
#' stdz_district(state = c("CA", "NY"), district = c(12, 3))
#' # "CA-12" "NY-03"
#' stdz_district(full_district = "CA12", sep_loc = 2)
#' # "CA-12"
#' @export
stdz_district <- function(full_district = character(), state, district, denote_sen = "00", denote_al = "01", sep = "-", old_sep = NA, sep_loc = NA) {
  if (length(full_district) != 0) {
    if (!is.na(old_sep)){
      district_frame <- as.data.frame(do.call(rbind,strsplit(full_district, old_sep)))
      names(district_frame) <- c("state", "district")
    } else if (!is.na(sep_loc)) {
      states <- substr(full_district, 1,sep_loc)
      districts <- substr(full_district, sep_loc+1,5)
      district_frame <- as.data.frame(cbind(states, districts))
      names(district_frame) <- c("state", "district")
    } else {
      district_frame <- as.data.frame(do.call(rbind,strsplit(full_district, sep)))
      names(district_frame) <- c("state", "district")
    }
  } else {
  district_frame <- as.data.frame(cbind(state, district))
  names(district_frame) <- c("state", "district")
  }
  district_frame$district <- gsub("al", denote_al, district_frame$district)
  district_frame$district <- gsub("AL", denote_al, district_frame$district)
  district_frame$district <- stringr::str_pad(district_frame$district, 2, side = "left", pad = 0)
  std_districts <- paste(district_frame$state,district_frame$district, sep = sep )

  return(std_districts)
  
}