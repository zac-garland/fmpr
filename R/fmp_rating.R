#' Company financial rating
#'
#' @param ticker a stock ticker
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_rating(ticker = "AAPL")

fmp_rating <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("rating/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
