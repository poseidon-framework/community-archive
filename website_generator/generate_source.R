library(magrittr)

total_janno <- poseidonR::read_janno("../.", validate = F)

janno_table <- total_janno %>%
  dplyr::group_by(source_file) %>%
  dplyr::summarise(
    `# Inds` = dplyr::n(),
    Package = dirname(unique(source_file)),
    `# ancient` = (Date_Type %in% c("C14", "context")) %>% sum(na.rm = TRUE),
    `# modern` = (Date_Type == "modern") %>% sum(na.rm = TRUE),
    `Github link` = paste0(
      "[Github](https://github.com/poseidon-framework/published_data/tree/master/",
      Package, ")"
    ),
    `Download link` = paste0(
      "[Download](http://c107-224.cloud.gwdg.de:3000/zip_file/", Package, ")"
    ),
    `View link` = paste0("[View](", Package, ".html)")
  ) %>%
  dplyr::select(-source_file)

pac_names <- janno_table$Package#[1:2]

generate_Rmd <- function(x) {
  path <- file.path("website_source", paste0(x, ".Rmd"))
  template <- readLines("package_page_template.Rmd")
  template_mod <- gsub("####package_name####", x, template)
  writeLines(template_mod, con = path)
}
purrr::walk(pac_names, generate_Rmd)

write(
  knitr::kable(janno_table, format = "pipe") %>% as.character(),
  file = file.path("website_source", "index.Rmd")
)

rmarkdown::render_site(input = "website_source")
