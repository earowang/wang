#' Create project for research articles and data analyses
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
  # usethis::use_git_ignore(c(".DS_Store"))

  # README
  usethis::use_readme_md(open = FALSE)
  # I put my resuable functions to /R
  usethis::use_directory("R")
  # I put my analysis code to /scripts
  usethis::use_directory("scripts")
  # I put my analysis rmd to /analysis
  usethis::use_directory("analysis")
  rmd_path <- use_template("project/index.Rmd")
  file.copy(rmd_path, paste0(path, "/analysis/index.Rmd"))
  # I put raw data /data-raw
  usethis::use_directory("data-raw")
  # I put cleaned data /data
  usethis::use_directory("data")

  invisible(TRUE)
}
