This package contains data published in **Moroni et al. (2026), *iScience*.**

The data were processed from FASTQ files available through the [European Nucleotide Archive (ENA)](https://www.ebi.ac.uk/ena/browser/view/PRJEB105378) under project accession **PRJEB105378**.

FASTQ files were aligned to the **hg19 reference genome** and processed into BAM format using a standard FASTQ-to-BAM pipeline. The resulting BAM files were subsequently converted to PLINK format using [`adna_to_dataset` v0.9](https://github.com/teepean/adna_to_dataset), specifically the [`bam_to_plink.sh`](https://github.com/teepean/adna_to_dataset/blob/main/bam_to_plink.sh) script.
