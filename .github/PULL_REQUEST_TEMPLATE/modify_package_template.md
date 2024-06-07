### PR Checklist for modifying one or multiple existing packages

- [ ] The changes maintain the structural integrity of the affected packages.
- [ ] The checksums of the modified files in the respective `POSEIDON.yml` files were adjusted properly.
- [ ] Every file in the submission is correctly referenced in the relevant `POSEIDON.yml` files and there are no additional, supplementary files in the submission that are not documented there.

***

- [ ] The `packageVersion` numbers of the affected packages were increased in their `POSEIDON.yml` files.
- [ ] The changes in the `packageVersion` followed the Poseidon [Package versioning policy](https://github.com/poseidon-framework/poseidon-schema?tab=readme-ov-file#package-versioning).
- [ ] The changes were documented in the respective `CHANGELOG` files. If no `CHANGELOG` files existed previously it was added here.
- [ ] The `lastModified` fields of the affected `POSEIDON.yml` files were updated.
- [ ] The `contributor` fields were updated with `name`, `email` and `orcid` of the relevant, new contributors.
- [ ] The `.janno` and the `.ssf` files are not fully quoted, so they only use double quotes (`"..."`) to enclose text fields where it is strictly necessary.

***

- [ ] All affected packages pass a validation with `trident validate --fullGeno`.

***

- [ ] Large genotype data files are properly tracked with Git LFS and not directly pushed to the repository. For an instruction on how to set up Git LFS please look [here](https://www.poseidon-adna.org/#/archive_submission_guide?id=submitting-the-package). If you accidentally pushed the files the wrong way you can fix it with `git lfs migrate import --no-rewrite path/to/file.bed` (see [here](https://github.com/git-lfs/git-lfs/blob/main/docs/man/git-lfs-migrate.adoc#import-without-rewriting-history)).
