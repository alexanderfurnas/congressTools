#' Normalize Chamber Labels
#'
#' Convert common shorthand for congressional chambers to a consistent format.
#' Recognizes variants like \code{"sen"}, \code{"S"}, \code{"Senate"},
#' \code{"upper"}, \code{"rep"}, \code{"H"}, \code{"House"}, \code{"lower"},
#' and common abbreviations. Case-insensitive.
#'
#' @param chamber A character string or vector of chamber labels to normalize.
#' @param to Output format: \code{"full"} (default) returns \code{"Senate"}/\code{"House"},
#'   \code{"short"} returns \code{"S"}/\code{"H"},
#'   \code{"abbr"} returns \code{"sen"}/\code{"rep"}.
#' @return A character vector of normalized chamber labels. Returns \code{NA}
#'   for unrecognized inputs.
#' @examples
#' chamber_label(c("sen", "H", "house", "S"))
#' # "Senate" "House"  "House"  "Senate"
#'
#' chamber_label("Senate", to = "short")
#' # "S"
#'
#' chamber_label(c("upper", "lower"), to = "abbr")
#' # "sen" "rep"
#' @export
chamber_label <- function(chamber, to = "full") {
  senate_variants <- c("s", "sen", "senate", "upper")
  house_variants <- c("h", "r", "rep", "house", "lower")

  formats <- list(
    full  = c(senate = "Senate",  house = "House"),
    short = c(senate = "S",       house = "H"),
    abbr  = c(senate = "sen",     house = "rep")
  )

  if (!to %in% names(formats)) {
    stop("'to' must be one of 'full', 'short', or 'abbr'")
  }

  fmt <- formats[[to]]
  input <- tolower(trimws(chamber))

  result <- ifelse(
    input %in% senate_variants, fmt[["senate"]],
    ifelse(input %in% house_variants, fmt[["house"]], NA_character_)
  )

  return(result)
}
