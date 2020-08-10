#' Real time stock price
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_quote_short(ticker = "AAPL")

fmp_quote_short <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("quote-short/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
