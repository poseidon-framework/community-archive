## PR Checklist for a new package submission

- [ ] The package does not exist already in the community archive, also not with a different name.
- [ ] The package title in the `POSEIDON.yml` conforms to the general title structure suggested here: `<Year>_<Last name of first author>_<Region, time period or special feature of the paper>`, e.g. `2021_Zegarac_SoutheasternEurope`, `2021_SeguinOrlando_BellBeaker` or `2021_Kivisild_MedievalEstonia`.
- [ ] The package is stored in a directory that is named like the package title.

***

- [ ] The package is complete and features the following elements:
  - [ ] Genotype data in binary PLINK format (not EIGENSTRAT format).
  - [ ] A `POSEIDON.yml` file with not just the file-referencing fields, but also the following meta-information fields present and filled: `poseidonVersion`, `title`, `description`, `contributor`, `packageVersion`, `lastModified` (see [here](https://github.com/poseidon-framework/poseidon-schema/blob/master/POSEIDON_yml_fields.tsv) for their definition)
  - [ ] A reasonably filled `.janno` file (for a list of available fields look [here](https://github.com/poseidon-framework/poseidon-schema/blob/master/janno_columns.tsv) and [here](https://www.poseidon-adna.org/#/janno_details) for more detailed documentation about them).
  - [ ] A `.bib` file with the necessary literature references for each sample in the `.janno` file.
- [ ] Every file in the submission is correctly referenced in the `POSEIDON.yml` file and there are no additional, supplementary files in the submission that are not documented there.
- [ ] Genotype data, `.janno` and `.bib` file are all named after the package title and only differ in the file extension.
- [ ] The package version in the `POSEIDON.yml` file is `1.0.0`.
- [ ] The `poseidonVersion` of the package in the `POSEIDON.yml` file is set to the latest version of the [Poseidon schema](https://github.com/poseidon-framework/poseidon-schema/releases).
- [ ] The `POSEIDON.yml` file contains the corresponding checksums for the fields `genoFile`, `snpFile`, `indFile`, `jannoFile` and `bibFile`.
- [ ] There is either no `CHANGELOG` file or one with a single entry for version `1.0.0`.

***

- [ ] The `Publication` column in the `.janno` file is filled and the respective `.bib` file has complete entries for the listed mentioned keys.
- [ ] The `.janno` file does not include any empty columns or columns only filled with `n/a`.
- [ ] The order of columns in the `.janno` file adheres to the standard order as defined in the Poseidon schema [here](https://github.com/poseidon-framework/poseidon-schema/blob/master/janno_columns.tsv).

***

- [ ] The package passes a validation with `trident validate --fullGeno`.

***

- [ ] Large genotype data files are properly tracked with Git LFS and not directly pushed to the repository. For an instruction on how to set up Git LFS please look [here](https://www.poseidon-adna.org/#/archive_submission_guide?id=submitting-the-package). If you accidentally pushed the files the wrong way you can fix it with `git lfs migrate import --no-rewrite path/to/file.bed` (see [here](https://github.com/git-lfs/git-lfs/blob/main/docs/man/git-lfs-migrate.adoc#import-without-rewriting-history)).
