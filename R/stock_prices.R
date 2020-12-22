#' historical price with row filter
#' @param timeseries number of records to return
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_price(ticker = "AAPL")

fmp_historical_price <- function(ticker = "AAPL", start_date = NULL, end_date = NULL) {
  apikey <- fmp_api_key()

  if(is.null(start_date)) start_date <- (Sys.Date() - 3650)
  if(is.null(end_date)) end_date <- Sys.Date()

  start_date <- as.character(start_date)
  end_date <- as.character(end_date)


  fmp_url <- fmp_url_builder(glue::glue("historical-price-full/{ticker}?from={start_date}&to={end_date}&apikey={apikey}"))




  fmp_data(fmp_url)
}
#' intraday stock prices
#'
#' @param ticker a stock ticker
#' @param period intraday period
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_intraday(ticker = "AAPL", freq = c("1min", "5min", "15min",
#'     "30min", "1hour", "4hour"))

fmp_intraday <- function(ticker = "AAPL", freq = c("1min","5min","15min","30min","1hour","4hour")){

  apikey <- fmp_api_key()
  freq <- freq[[1]]
  fmp_url <- fmp_url_builder(glue::glue("historical-chart/{freq}/{ticker}?apikey={apikey}"))

  df <- fmp_data(fmp_url)

  if(!("symbol" %in% names(df)))
    df %>% tibble::add_column(symbol = ticker,.before = 1)
  else
    df


}
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
