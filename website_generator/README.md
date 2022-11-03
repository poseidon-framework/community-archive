This directory holds the code for the https://poseidon-framework.GitHub.io/published_data website. It works as follows:

- If the [validation GitHub action](https://GitHub.com/poseidon-framework/published_data/blob/master/.GitHub/workflows/validation.yml) passes, then the [buildWebsite action](https://GitHub.com/poseidon-framework/published_data/blob/master/.GitHub/workflows/buildWebsite.yml) runs.
- This action installs R, pandoc and all dependencies necessary to render the website. The dependencies are listed in the minimal [DESCRIPTION file](DESCRIPTION) in this directory.
- The action also runs the [generate_source.R](generate_source.R) script. This script reads the .janno files and builds the building blocks of the website in the [website_source/](website_source) directory.
- As the website is an [Rmarkdown website](https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html) we need .Rmd files for each package page. These are created from a template ([package_page_template.Rmd](package_page_template.Rmd)), where the name of each package can be filled in by generate_source.R. The index.Rmd file is built right in the script. Some other elements of the website are static and already in website_source/. All dynamic elements are ignored by Git.
- generate_source.R finally runs `rmarkdown::render_site` to transform the generated .Rmd files to .html files (and thus the website) in website_source/_site/.
- The buildWebsite GitHub action takes the content of _site/ and deploys it to the gh-pages branch, from where it is served as the website we know and love.

For development/testing I suggest to open the RStudio project in this directory, make the desired changes in generate_source.R and package_page_template.Rmd and then run generate_source.R to render the website locally. Before pushing this to GitHub, remember to add new dependencies to the DESCRIPTION file.
