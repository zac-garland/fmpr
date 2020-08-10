#' current discount cash flow valuation
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_discounted_cash_flow(ticker = "AAPL")

fmp_discounted_cash_flow <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("discounted-cash-flow/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
