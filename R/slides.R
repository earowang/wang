#' Create xaringan slides
#'
#' @param path A path.
#' @param event A string. Which event.
#' @param date A string. On which day of the event.
#'
#' @export
create_slides <- function(path, event, date) {
  # create RStudio project
  invisible(utils::capture.output(
    usethis::create_project(path, rstudio = TRUE, open = FALSE)
  ))
  # I put my R code to /src instead of /R
  file.rename(paste0(path, "/R"), paste0(path, "/src"))

  # use Makefile
  makefile_path <- system.file("templates", "Makefile", package = "wang")
  file.copy(makefile_path, paste0(path, "/Makefile"))

  # use my custom xaringan css
  css_path <- system.file("templates", "remark.css", package = "wang")
  file.copy(css_path, paste0(path, "/remark.css"))

  # use custom ggplot theme for slides
  r_path <- system.file("templates", "theme.R", package = "wang")
  file.copy(r_path, paste0(path, "/src/theme.R"))

  # init README.md
  write_template(path, "README.md", list(event = event, date = date))

  # init index.Rmd
  write_template(path, "index.Rmd", list(date = date))
}

write_template <- function(path, file, data = list()) {
  temp_path <- system.file("templates", file, package = "wang")
  file_name <- readLines(temp_path)
  repo <- strsplit(path, "/")[[1]]
  repo <- repo[length(repo)]
  data <- c(data, repo = repo)
  done <- strsplit(whisker::whisker.render(file_name, data), "\n")[[1]]
  write_utf8(paste0(path, "/", file), done)
}

# usethis:::write_utf8
write_utf8 <- function (path, lines) {
  stopifnot(is.character(path))
  stopifnot(is.character(lines))
  con <- file(path, encoding = "utf-8")
  on.exit(close(con), add = TRUE)
  if (length(lines) > 1) {
    lines <- paste0(lines, "\n", collapse = "")
  }
  cat(lines, file = con, sep = "")
  invisible(TRUE)
}
