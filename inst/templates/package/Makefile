document:
	Rscript -e "devtools::document()"

readme:
	Rscript -e "rmarkdown::render('README.Rmd')"

build:
	Rscript -e "devtools::build()"

test:
	Rscript -e "devtools::test()"

tidy:
	Rscript -e "usethis::use_tidy_description()"

check:
	Rscript -e "devtools::check()"

install:
	Rscript -e "devtools::install(dependencies = FALSE)"

winbuild:
	Rscript -e "devtools::check_win_devel(quiet = TRUE)"

pkgdown:
	Rscript -e "pkgdown::build_site(run_dont_run = TRUE)"
