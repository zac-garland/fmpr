#' Comapny Balance Sheet Items
#'
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_balance_sheet(ticker = "AAPL", period = "quarter")

fmp_balance_sheet <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("balance-sheet-statement/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
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



#' income statement items
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_income_statement(ticker = "AAPL", period = "quarter")

fmp_income_statement <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("income-statement/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
