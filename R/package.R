#' Create R package
#'
#' @param path A path.
#'
#' @export
create_package <- function(path) {
  usethis::create_package(path, rstudio = TRUE, open = FALSE)
  usethis::use_git_ignore(c("docs"))
  usethis::use_build_ignore(c("Makefile", "docs", "_pkgdown.yml"))
  invisible(TRUE)
}
