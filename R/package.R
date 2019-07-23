#' Create R package
#'
#' @param path A path.
#'
#' @export
create_package <- function(path) {
  usethis::create_package(path, rstudio = TRUE, open = FALSE)
  usethis::use_git_ignore(c("docs"))
  usethis::use_build_ignore(c("Makefile", "docs", "_pkgdown.yml",
    ".pre-commit-config.yaml"))

  # use Makefile
  makefile_path <- use_template("package/Makefile")
  file.copy(makefile_path, paste0(path, "/Makefile"))
  # use pre-commit hook
  pre_commit <- use_template("package/.pre-commit-config.yaml")
  file.copy(pre_commit, paste0(path, "/.pre-commit-config.yaml"))
  invisible(TRUE)
}
