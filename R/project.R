#' Create project for data analysis
#'
#' @param path A path.
#'
#' @export
create_project <- function(path) {
  dir.create(path)
  path <- normalizePath(path, mustWork = TRUE)
  usethis::proj_set(path, force = TRUE)

  # create RStudio project
  usethis::use_rstudio()
  usethis::use_git_ignore(c(".DS_Store"))

  # I put my R code to /R
  usethis::use_directory("R")
  # I put data /data
  usethis::use_directory("data")

  invisible(TRUE)
}
