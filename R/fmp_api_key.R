#' fmp_api_key
#'
#' @export

fmp_api_key <- function(api_key) {
  if (!missing(api_key)) {
    options(fmp_api_key = api_key)
  }
  api_key <- getOption('fmp_api_key')

  if(is.null(api_key))
    stop('please set your api key using: fmp_api_key("api_key")')
  else
    invisible(api_key)

}


fmp_url_builder <- function(...){

  base <- "https://financialmodelingprep.com/api/v3/"

  dat_args <- paste0(base,...)

  URLencode(dat_args)

}
