fmp_data <- function(fmp_url) {
  print(fmp_url)

  df <- jsonlite::fromJSON(fmp_url)

  any_list_cols <- df %>%
    as_tibble() %>%
    select_if(purrr::is_list) %>%
    names()



  if (length(any_list_cols) > 0) {

    if ("list" %in% class(df)) {

      df <- df %>%
        as.data.frame() %>%
        setNames(str_replace(names(.), paste0(any_list_cols, "."), "")) %>%
        as_tibble()

    } else{

      symbol <- unique(df[[1]])
      df <- df %>% unnest(cols = c(any_list_cols))


    }


  }

  df %>%
    as_tibble() %>%
    janitor::clean_names() %>%
    mutate_all(as.character) %>%
    mutate_all(parse_guess) %>%
    select(which(sapply(.,class)=="character"),
           which(sapply(.,class)=="Date"),
           contains("date"),
           which(sapply(.,class)=="numeric"),
           everything())

}
