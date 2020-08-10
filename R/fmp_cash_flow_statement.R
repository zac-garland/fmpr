#' company cash flow statement items
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_cash_flow_statement(ticker = "AAPL", period = "quarter")

fmp_cash_flow_statement <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("cash-flow-statement/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}



