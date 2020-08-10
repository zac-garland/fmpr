#' Real Time Stock Details
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_quote(ticker = "AAPL")

fmp_quote <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("quote/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
