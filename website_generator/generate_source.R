library(magrittr)

repo_path <- ".."

#### janno input ####

# read all janno files
total_janno <- poseidonR::read_janno(repo_path, validate = F)

# compile a useful overview table for all packages
janno_table <- total_janno %>%
  dplyr::group_by(source_file) %>%
  dplyr::summarise(
    `# Inds` = dplyr::n(),
    Package = dirname(unique(source_file)),
    `# ancient` = (Date_Type %in% c("C14", "context")) %>% sum(na.rm = TRUE),
    `# modern` = (Date_Type == "modern") %>% sum(na.rm = TRUE),
    `Github` = paste0(
      "[Github](https://github.com/poseidon-framework/published_data/tree/master/",
      Package, ")"
    ),
    `Download` = paste0(
      "[Download](http://c107-224.cloud.gwdg.de:3000/zip_file/", Package, ")"
    ),
    `View` = paste0("[View](", Package, ".html)")
  ) %>%
  dplyr::select(-source_file)

pac_names <- janno_table$Package#[1:5]

#### read bib data ####

# find all .bib files
# bib_file_paths <- list.files("../.", pattern = ".bib", full.names = TRUE, recursive = TRUE)
# purrr::map(bib_file_paths, bibtex::read.bib) # this fails!

#### prepare package-wise .Rmd files ####

generate_Rmd <- function(x) {
  out_path <- file.path("website_source", paste0(x, ".Rmd"))
  template <- readLines("package_page_template.Rmd")
  template_mod <- gsub("####package_name####", x, template)
  writeLines(template_mod, con = out_path)
}
purrr::walk(pac_names, generate_Rmd)

#### copy the .bib file for each package ####

copy_bib <- function(x) {
  pac_path <- file.path(repo_path, x)
  bib_file <- list.files(pac_path, pattern = ".bib", full.names = TRUE)
  if (length(bib_file) == 1) {
    out_path <- file.path("website_source", paste0(x, ".bib"))
    file.copy(bib_file, out_path)
  }
}
purrr::walk(pac_names, copy_bib)

#### render landing page figure ####

source("create_landing_page_figure.R")

#### create index.Rmd file ####

write(c(
  "---",
  "title: Poseidon published data",
  "---",
  "",
  '![](landing_page_figure.png "World map with all ancient, dated and located samples in the Poseidon repository")',
  "",
  knitr::kable(janno_table, format = "pipe") %>% as.character()
  ),
  file = file.path("website_source", "index.Rmd")
)

#### render website from .Rmd files

rmarkdown::render_site(input = "website_source")
