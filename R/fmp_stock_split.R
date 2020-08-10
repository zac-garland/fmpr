#' company stock split information
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_stock_split(ticker = "AAPL")

fmp_stock_split <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical-price-full/stock_split/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
