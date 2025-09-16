# Antonio et al., 2024 (eLife) Data

This package contains data published in **Antonio et al., 2024** (*eLife*).

The data were processed from BAM file(s) available on the [European Nucleotide Archive (ENA)](https://www.ebi.ac.uk/ena/browser/) under project accession **PRJEB53564**.  

Sample(s) were genotyped from the BAM file(s) using **[pileupCaller from SequenceTools](https://github.com/stschiff/sequenceTools)** and **[SAMtools](https://github.com/samtools/samtools)**.  
The resulting genotype data were then converted to PLINK format using **[`adna_to_dataset` (v0.8)](https://github.com/teepean/adna_to_dataset)**, specifically the **[`bam_to_plink.sh`](https://github.com/teepean/adna_to_dataset/blob/main/bam_to_plink.sh)** script.
