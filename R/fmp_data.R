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
    hide_key <- strsplit(test_str,"apikey=") %>%
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
