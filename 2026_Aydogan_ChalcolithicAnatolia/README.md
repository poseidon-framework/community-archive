This package contains data published in **Aydoğan et al. (2026), *Cell*.**

The data were processed from BAM files available through the [European Nucleotide Archive (ENA)](https://www.ebi.ac.uk/ena/browser/view/PRJEB98139) under project accession **PRJEB98139**.

Pseudohaploid genomes were called using the **hg19 reference genome**. The resulting BAM files were subsequently converted to PLINK format using [`adna_to_dataset` v0.9](https://github.com/teepean/adna_to_dataset), specifically the [`bam_to_plink.sh`](https://github.com/teepean/adna_to_dataset/blob/main/bam_to_plink.sh) script.
