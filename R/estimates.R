#' Company financial ratios
#'
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_analyst_estimates(ticker = "AAPL", period = "quarter")

fmp_analyst_estimates <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("analyst-estimates/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
