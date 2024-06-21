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
#' historical enterprise value
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_enterprise_value(ticker = "AAPL", period = "quarter")

fmp_enterprise_value <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("enterprise-values/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
#' historical growth metrics
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_financial_growth(ticker = "AAPL", period = "quarter")

fmp_financial_growth <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("financial-growth/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
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
#' company key metrics
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_key_metrics(ticker = "AAPL", period = "quarter")

fmp_key_metrics <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("key-metrics/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
#' Company financial ratios
#'
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_ratios(ticker = "AAPL", period = "quarter")

fmp_ratios <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("ratios/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}


#' Company Share Floats
#'
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_shares_float(ticker = "AAPL")

fmp_shares_float <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical/shares_float/?symbol={ticker}&apikey={apikey}"),version = 4)

  fmp_data(fmp_url)
}


#' Market Cap
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_market_cap(ticker = "AAPL")

fmp_historical_market_cap <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()
  fmp_url <- fmp_url_builder(glue::glue("historical-market-capitalization/{ticker}?limit=1650&apikey={apikey}"),version = 3)

  fmp_data(fmp_url)
}
