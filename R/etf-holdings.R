#' etf holdings information
#' @param symbol etf symbol
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_etf_holdings(symbol = "SPY")

fmp_etf_holdings <- function(symbol = "IWF") {
  apikey <- fmp_api_key()

  etf_holdings_date <- fmp_url_builder(glue::glue("etf-holdings/portfolio-date?symbol={symbol}&apikey={apikey}"),version = 4) %>%
    fmp_data() %>%
    dplyr::filter(date == max(date,na.rm=TRUE)) %>%
    dplyr::pull()

  fmp_url <- fmp_url_builder(glue::glue("etf-holdings?date={etf_holdings_date}&symbol={symbol}&apikey={apikey}"),version = 4)

  fmp_data(fmp_url) %>%
    tibble::add_column(etf_symbol = symbol,.before = 1)
}
