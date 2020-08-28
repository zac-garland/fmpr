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
