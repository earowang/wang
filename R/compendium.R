#' Create research compendium
#'
#' @param path A path.
#'
#' @export
create_compendium <- function(path) {
  dir.create(path)
  path <- normalizePath(path, mustWork = TRUE)
  usethis::proj_set(path, force = TRUE)

  # create RStudio project
  usethis::use_rstudio()
  # usethis::use_git_ignore(c(".DS_Store"))

  # README
  usethis::use_readme_md(open = FALSE)
  # use Makefile
  makefile_path <- use_template("compendium/Makefile")
  file.copy(makefile_path, paste0(path, "/Makefile"))
  # use pre-commit hooks
  pre_commit_path <- use_template("compendium/.pre-commit-config.yaml")
  file.copy(pre_commit_path, paste0(path, "/.pre-commit-config.yaml"))
  # use rmarkdown
  rmarkdown::draft(
    paste0(path, "/index.Rmd"), 
    template = "workingpaper", 
    package = "MonashEBSTemplates", 
    create_dir = FALSE, 
    edit = FALSE
  )
  # I put my resuable functions to /R
  usethis::use_directory("R")
  # I put my analysis code to /scripts
  usethis::use_directory("scripts")
  # I put my analysis rmd to /analysis
  usethis::use_directory("analysis")
  # I put raw data /data-raw
  usethis::use_directory("data-raw")
  # I put cleaned data /data
  usethis::use_directory("data")
  # DESCRIPTION
  write_template(path, "compendium/DESCRIPTION", dest = "DESCRIPTION")

  invisible(TRUE)
}
