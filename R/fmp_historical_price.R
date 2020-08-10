#' historical price with row filter
#' @param timeseries number of records to return
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_historical_price(ticker = "AAPL", timeseries = 5)

fmp_historical_price <- function(ticker = "AAPL", timeseries = 5) {
  apikey <- fmp_api_key()

  if(missing(timeseries)){
    fmp_url <- fmp_url_builder(glue::glue("historical-price-full/{ticker}?&apikey={apikey}"))
  } else{
    fmp_url <- fmp_url_builder(glue::glue("historical-price-full/{ticker}?timeseries={timeseries}&apikey={apikey}"))

  }



  fmp_data(fmp_url)
}
