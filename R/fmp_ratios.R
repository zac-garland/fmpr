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
