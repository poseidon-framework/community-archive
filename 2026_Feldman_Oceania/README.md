
## Dataset overview

This Poseidon v3.0.0 package contains 71 ancient human genotype records from Fiji (49), Vanuatu (15), Tonga (4), and the Solomon Islands (3), associated with Feldman et al. (2026). The records have 70 distinct `Individual_ID` values because two genotype records, `SIG050` and `SIG053`, share the individual identifier `SIG050_053`.

The package uses binary PLINK genotype data (`2026_Feldman_Oceania.bed`, `.bim`, `.fam`), with the SNP set declared as `1240K` in `POSEIDON.yml`. Metadata are provided in `2026_Feldman_Oceania.janno`. The bibliography is `FeldmanCell2026.bib`; `FeldmanCell2026` is the publication key used in the Janno file.

## Chronological metadata

Dates were transcribed from Feldman et al. (2026), supplementary Tables S1A and S1B, with references to earlier studies where given. 

For `SIG050` and `SIG053` (burial 92b), the two radiocarbon determinations MAMS-49658 (AD 160-550) and MAMS-49661 (AD 370-660) are recorded together because their assignment to the individual genotype records is unresolved. Both records are therefore assigned the conservative combined 95.4% (2 sigma) calibrated interval AD 160-660 in `Date_BC_AD_Start` and `Date_BC_AD_Stop`, respectively. `Date_BC_AD_Median` remains `n/a` because no individual-specific median date can be established. See `Date_Note` and Feldman et al. (2026), Table S1B.

## Individual identifiers and genetic relatedness

Relatedness assignments were compiled from Feldman et al. (2026), supplementary Table S1Q. Where library-level assignments for a pair conflicted, the closest reported relationship degree was used for reporting, in this order:

`first > second > thirdToFifth > unrelated`

This rule is a metadata reporting convention, not a claim that the selected degree is the statistically most likely relationship. Original library-level assignments should be consulted in supplementary Table S1Q.

## Sequencing source metadata

The sequencing source file (`2026_Feldman_Oceania.ssf`) contains 86 sequencing runs associated with the 71 genotype records. Sequencing accessions and associated metadata were obtained from ENA study PRJEB102472.

Library preparation types were compiled primarily from Feldman et al. (2026), supplementary Table S1C. Missing UDG treatment assignments were inferred from the laboratory preparation protocols described in the publication: double-stranded libraries were assigned `half` and single-stranded libraries were assigned `minus`. These inferred assignments are not independently verified library-specific UDG measurements.

The library preparation types of `SIG002.A0101.TF1.1`, `SIG014.A0101.TF1.1`, and `SIG050.A0101.TF1.1` remain unresolved because the available supplementary metadata do not unambiguously identify their library-specific preparation methods. Their `library_built` values were reported as `n/a`.


The UDG treatments of `SIG002.A0101.TF1.1` and `SIG014.A0101.TF1.1` also remain unresolved. `SIG050.A0101.TF1.1` retains its pre-existing `udg = minus` assignment, although its original source has not yet been independently verified.
