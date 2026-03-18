# congressTools

Simple utility functions for working with U.S. Congressional data in R.

## Installation

```r
# install.packages("devtools")
devtools::install_github("alexanderfurnas/congressTools")
```

## Functions

### `congress_to_year(congress, year = "first")`

Convert a Congress number to a calendar year.

```r
congress_to_year(116)
# [1] 2019

congress_to_year(116, year = "second")
# [1] 2020
```

### `year_to_congress(year)`

Convert a calendar year to the corresponding Congress number.

```r
year_to_congress(2019)
# [1] 116
```

### `congress_to_date_range(congress)`

Get the start and end dates of a Congress.

```r
congress_to_date_range(116)
#   congress      start        end
# 1      116 2019-01-03 2021-01-03
```

### `state_fips(state, to = "fips")`

Convert between state abbreviations and FIPS codes.

```r
state_fips(c("CA", "NY"))
# [1] "06" "36"

state_fips("06", to = "abbr")
# [1] "CA"
```

### `chamber_label(chamber, to = "full")`

Normalize chamber shorthand to a consistent format.

```r
chamber_label(c("sen", "H", "lower"))
# [1] "Senate" "House"  "House"

chamber_label("Senate", to = "short")
# [1] "S"
```

### `is_redistricting_congress(congress)`

Flag whether a Congress is the first to use post-Census district lines.

```r
is_redistricting_congress(108)
# [1] TRUE   (2003, after 2000 Census)
```

### `stdz_district(full_district, state, district, ...)`

Standardize congressional district identifiers to a consistent format.

```r
# From combined strings
stdz_district(full_district = c("CA-12", "NY-al"))
# [1] "CA-12" "NY-01"

# From separate state and district
stdz_district(state = c("CA", "NY"), district = c(12, 3))
# [1] "CA-12" "NY-03"

# From strings without a separator
stdz_district(full_district = "CA12", sep_loc = 2)
# [1] "CA-12"
```

## License

MIT
