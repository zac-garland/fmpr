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
