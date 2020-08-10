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
