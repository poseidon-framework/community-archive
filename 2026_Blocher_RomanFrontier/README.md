This package contains data published in **Blöcher et al. (2026), *Nature*.**

The data were processed from BAM files available through the [European Nucleotide Archive (ENA)](https://www.ebi.ac.uk/ena/browser/view/PRJEB87112) under project accession **PRJEB87112**.

Pseudohaploid genomes were called using the **hg19 reference genome**. The resulting BAM files were subsequently converted to PLINK format using [`adna_to_dataset` v0.9](https://github.com/teepean/adna_to_dataset), specifically the [`bam_to_plink.sh`](https://github.com/teepean/adna_to_dataset/blob/main/bam_to_plink.sh) script.
