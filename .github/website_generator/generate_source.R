total_janno <- poseidonR::read_janno("../../.", validate = F) # generation of new website should maybe fail on validation errors

pac_names <- total_janno$source_file |> unique() |> dirname()

generate_Rmd <- function(x) {
  path <- file.path("website_source", paste0(x, ".Rmd"))
  if (!dir.exists(dirname(path))) {
    dir.create(dirname(path))
  }
  writeLines(paste("#", x, "\n\nhuhu"), con = path)
}

purrr::walk(pac_names, generate_Rmd)

site_yml_file <- file.path("website_source", "_site.yml")
index_file <- file.path("website_source", "index.Rmd")

write(paste0(c(
  "name: \"poseidon-published-data\"",
  "navbar:",
  "  title: \"Poseidon published data repository\"",
  "  left:",
  "    - text: \"Overview\"",
  "      href: index.html"
  )
), file = site_yml_file)

write(
  purrr::map_chr(
    pac_names,
    function(x) {
      paste0("[", x, "](", x, ".html)")
    }
  ),
  file = index_file
)

rmarkdown::render_site(
  input = "website_source"
)

