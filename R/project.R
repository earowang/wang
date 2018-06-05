#' Create project for data analysis
#'
#' @param path A path.
#'
#' @export
create_project <- function(path) {
  usethis::create_project(path, rstudio = TRUE, open = FALSE)
  usethis::use_git_ignore(c(".DS_Store"))

  # I put my R code to /src
  usethis::use_directory("src")
  # I put data /data
  usethis::use_directory("data")

  invisible(TRUE)
}
