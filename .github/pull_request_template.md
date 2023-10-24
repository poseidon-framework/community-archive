<!--
# Adding or modifying a package in poseidon-framework/community-archive

Hello there!

Thanks for either
i. preparing a new package for submission to the community archive or
ii. improving a package.

Both tasks are described in the submission guide here: https://www.poseidon-adna.org/#/archive_submission_guide

Please ensure you are completing all the TODOs below.
-->

<!-- TODO: Delete this section if you are not adding a new package, but only modify an existing one. -->

## PR Checklist for a new package submission

### General package properties

- [ ] The package does not exist already in the community archive, also not with a different name.
- [ ] The package title in the `POSEIDON.yml` conforms to the general title structure suggested here: `<Year>_<Last name of first author>_<Region, time period or special feature of the paper>`, e.g. `2021_Zegarac_SoutheasternEurope`, `2021_SeguinOrlando_BellBeaker` or `2021_Kivisild_MedievalEstonia`.
- [ ] The package is stored in a directory that is named like the package title.

***

- [ ] The package is complete and features the following elements:
  - [ ] Genotype data in binary PLINK format.
  - [ ] A `POSEIDON.yml` file with all of the following non-file reference fields present and filled with meaningful information: `poseidonVersion`, `title`, `description`, `contributor`, `packageVersion`, `lastModified` (see [here](https://github.com/poseidon-framework/poseidon-schema/blob/master/POSEIDON_yml_fields.tsv) for their definition)
  - [ ] A reasonably filled `.janno` file.
  - [ ] A `.bib` file with references for each sample in the `.janno` file.
- [ ] Every file in the submission is correctly referenced in the `POSEIDON.yml` file and there are no additional, supplementary files in the submission that are not documented there.
- [ ] Genotype data, `.janno` and `.bib` file are all named after the package title and only differ in the file extension.
- [ ] All text files are UTF-8 encoded and have Unix/Unix-like line endings (`LF`, not `CR+LF` or `CR`)
- [ ] The package version in the `POSEIDON.yml` file is `1.0.0`.
- [ ] The `POSEIDON.yml` file contains the corresponding checksums for the fields `genoFile`, `snpFile`, `indFile`, `jannoFile` and `bibFile`.
- [ ] There is either no `CHANGELOG` file or one with a single entry for version `1.0.0`.

***

- [ ] The `Publication` column in the `.janno` file is filled and the respective `.bib` file has complete entries for the listed mentioned keys.
- [ ] The `.janno` file does not include any columns or columns only filled with `n/a`.
- [ ] The order of columns in the `.janno` file adheres to the standard order as defined in the Poseidon schema [here](https://github.com/poseidon-framework/poseidon-schema/blob/master/janno_columns.tsv).

***

- [ ] The package passes a validation with `trident validate --fullGeno`.

<!-- TODO: Delete this section if you are not modifying an existing package, but add an entirely new one. -->

## PR Checklist for modifying an existing package




<!-- TODO: Follow the steps outlined above and tick them off as you go. -->