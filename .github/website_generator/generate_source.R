# generation of new website should maybe fail on validation errors
total_janno <- poseidonR::read_janno("../../.", validate = F)

pac_names <- total_janno$source_file |> unique() |> dirname()
pac_names <- pac_names[1:3]

generate_Rmd <- function(x) {
  path <- file.path("website_source", paste0(x, ".Rmd"))
  template <- readLines("package_page_template.Rmd")
  template_mod <- gsub("####package_name####", x, template)
  writeLines(template_mod, con = path)
}

purrr::walk(pac_names, generate_Rmd)

index_file <- file.path("website_source", "index.Rmd")

pac_df <- data.frame(
  pac_links = purrr::map_chr(
    pac_names,
    function(x) {
      paste0("[", x, "](", x, ".html)")
    }
  )
)

write(
  knitr::kable(pac_df, format = "pipe") %>% as.character(),
  file = index_file
)

rmarkdown::render_site(
  input = "website_source"
)

