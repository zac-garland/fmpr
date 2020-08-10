#' historical enterprise value
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_enterprise_values(ticker = "AAPL", period = "quarter")

fmp_enterprise_values <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("enterprise-values/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
