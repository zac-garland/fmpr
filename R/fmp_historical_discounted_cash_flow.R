#' historical discounted cash flow valuation
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_discounted_cash_flow(ticker = "AAPL", period = "quarter")

fmp_historical_discounted_cash_flow <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical-discounted-cash-flow/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
