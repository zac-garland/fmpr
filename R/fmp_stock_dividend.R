#' company dividend info
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_stock_dividend(ticker = "AAPL")

fmp_stock_dividend <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical-price-full/stock_dividend/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
