#' sets fmp api key
#' @param api_key your api key
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_api_key("demo")

fmp_api_key <- function(api_key = NULL) {
  if (!is.null(api_key)) {
    Sys.setenv(fmp_api_key = api_key)
  } else if(Sys.getenv("fmp_api_key") == ""){
    message('using demo api key. \n please set your api key using: fmp_api_key("api_key")')
    Sys.setenv(fmp_api_key = "demo")
  }

  api_key <- Sys.getenv("fmp_api_key")

  invisible(api_key)

}


fmp_url_builder <- function(...){

  base <- "https://financialmodelingprep.com/api/v3/"

  dat_args <- paste0(base,...)

  URLencode(dat_args)

}
fmp_data <- function(fmp_url) {


  if (Sys.getenv("fmp_active_api_n")=="") {
    Sys.setenv(fmp_active_api_n = 1)
  } else{
    Sys.setenv(fmp_active_api_n = as.double(Sys.getenv("fmp_active_api_n"))+1)
  }

  if (Sys.getenv("fmp_show_api_call")=="") {
    Sys.setenv(fmp_show_api_call = FALSE)
  }

  if(Sys.getenv("fmp_show_api_call")){
    message(paste("getting data from",fmp_url))
  } else{
    hide_key <- strsplit(fmp_url,"apikey=") %>%
      unlist() %>%
      .[[1]] %>%
      paste0("apikey=apikey")

    message(paste("getting data from",hide_key))
  }


  df <- jsonlite::fromJSON(fmp_url)

  any_list_cols <- df %>%
    dplyr::as_tibble() %>%
    dplyr::select_if(purrr::is_list) %>%
    names()



  if (length(any_list_cols) > 0) {

    if ("list" %in% class(df)) {

      df <- df %>%
        as.data.frame() %>%
        setNames(stringr::str_replace(names(.), paste0(any_list_cols, "."), "")) %>%
        dplyr::as_tibble()

    } else{

      symbol <- unique(df[[1]])
      df <- df %>% tidyr::unnest(cols = c(any_list_cols))


    }


  }

  df %>%
    dplyr::as_tibble() %>%
    janitor::clean_names() %>%
    dplyr::mutate_all(as.character) %>%
    dplyr::mutate_all(readr::parse_guess) %>%
    dplyr::select(which(sapply(.,class)=="character"),
           which(sapply(.,class)=="Date"),
           dplyr::contains("date"),
           which(sapply(.,class)=="numeric"),
           dplyr::everything())

}
#' Pipe
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
#' @param lhs,rhs A visualisation and a function to apply to it
NULL
