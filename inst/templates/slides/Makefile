render:
	Rscript -e 'Sys.setenv("RSTUDIO_PANDOC" = "/Applications/RStudio.app/Contents/MacOS/pandoc"); library(knitr); rmarkdown::render("$(file).Rmd", output_file = "$(file).html")'

serve:
	Rscript -e 'Sys.setenv("RSTUDIO_PANDOC" = "/Applications/RStudio.app/Contents/MacOS/pandoc"); xaringan::infinite_moon_reader("$(file).Rmd")'

deploy:
	zsh deploy.sh
