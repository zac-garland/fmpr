#' company profile
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_company_profile(ticker = "AAPL")

fmp_company_profile <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("profile/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
#' historical earnings calendar - premium only
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_earning_calendar(ticker = "AAPL")

fmp_historical_earning_calendar <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical/earning_calendar/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
#' Company financial rating
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_rating(ticker = "AAPL")

fmp_rating <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("rating/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}

#' Company historical employment
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_employment(ticker = "AAPL")

fmp_historical_employment <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical/employee_count?symbol={ticker}&apikey={apikey}"),version = 4)

  fmp_data(fmp_url)
}

#' Company historical sentiment
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_sentiment(ticker = "AAPL")

fmp_historical_sentiment <- function(ticker = "AAPL",page = 0) {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical/social-sentiment?symbol={ticker}&page={as.character(page)}&apikey={apikey}"),version = 4)

  fmp_data(fmp_url)
}
