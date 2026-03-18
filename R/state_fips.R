#' State FIPS Codes
#'
#' Convert between two-letter state abbreviations and FIPS codes.
#' Covers all 50 states, DC, and U.S. territories (AS, GU, MP, PR, VI).
#'
#' @param state A state abbreviation, FIPS code (character or numeric), or vector
#'   of either. Input type is auto-detected.
#' @param to Output format: \code{"fips"} (default) to return FIPS codes,
#'   \code{"abbr"} to return state abbreviations.
#' @return A character vector of FIPS codes (zero-padded to two digits) or
#'   state abbreviations. Returns \code{NA} for unrecognized inputs.
#' @examples
#' state_fips("CA")
#' # "06"
#' state_fips(c("CA", "NY", "TX"))
#' # "06" "36" "48"
#' state_fips("06", to = "abbr")
#' # "CA"
#' state_fips(6, to = "abbr")
#' # "CA"
#' @export
state_fips <- function(state, to = "fips") {
  abbr_to_fips <- c(
    AL = "01", AK = "02", AZ = "04", AR = "05", CA = "06",
    CO = "08", CT = "09", DE = "10", FL = "12", GA = "13",
    HI = "15", ID = "16", IL = "17", IN = "18", IA = "19",
    KS = "20", KY = "21", LA = "22", ME = "23", MD = "24",
    MA = "25", MI = "26", MN = "27", MS = "28", MO = "29",
    MT = "30", NE = "31", NV = "32", NH = "33", NJ = "34",
    NM = "35", NY = "36", NC = "37", ND = "38", OH = "39",
    OK = "40", OR = "41", PA = "42", RI = "44", SC = "45",
    SD = "46", TN = "47", TX = "48", UT = "49", VT = "50",
    VA = "51", WA = "53", WV = "54", WI = "55", WY = "56",
    DC = "11", AS = "60", GU = "66", MP = "69", PR = "72", VI = "78"
  )

  fips_to_abbr <- stats::setNames(names(abbr_to_fips), abbr_to_fips)

  state <- toupper(trimws(as.character(state)))

  if (to == "fips") {
    result <- unname(abbr_to_fips[state])
  } else if (to == "abbr") {
    state <- stringr::str_pad(state, 2, side = "left", pad = "0")
    result <- unname(fips_to_abbr[state])
  } else {
    stop("'to' must be either 'fips' or 'abbr'")
  }

  return(result)
}
