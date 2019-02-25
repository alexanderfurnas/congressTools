#' Standardize District
#'
#' This function takes a district, vector of districts or state and district seperately and returns standardized district names.
#'
#' @param full_district district or vector of districts.
#' @param state state abbreviation or vector of state abbreviations.
#' @param district district number or vector of district numbers.
#' @param denote_al character to denote at large districts, in the district column, defaults to 01.
#' @param sep separator to use in the new standardized district names, if old_sep is not specified it is also the separator input districts are split on.
#' @param old_sep separator to split input districts on. Overrides sep for this role.
#' @param sep_loc location to split state from district. Use if there is no separator between state abbreviation and district number in the input. 
#' @return A vector of standardized districts
#' 
#' @export
stdz_district <- function(full_district = character(), state, district, denote_sen = "00", denote_al = "01", sep = "-", old_sep = NA, sep_loc = NA){
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