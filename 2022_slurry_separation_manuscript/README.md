# `2022_slurry_separation_manuscript`
Data and analysis for manuscript on effect of slurry separation on overall (storage + field application of both fractions) ammonia volatilization.

# Directory structure
## `EF_calcs` 
Caculations on overall emission factors (EF). 
See `EF_calcs/README.md` for details.

## `EF_comp` 
Comparison of emission from raw and separated slurry. 
Also comparison of emission vs. slurry dry matter (DM) relationship in measurements and from ALFAM2 predictions. 
Measurement data come from `lit_data` directory.
ALFAM2 predictions are from `EF_calcs` directory.

## `functions`
Various functions used in the analysis.
Some from <https://github.com/sashahafner/jumbled>.

## `lit_data`
Contains the literaure data in a single Excel spreadsheet.

# Links to manuscript
The following list documents the source of manuscript components

* Tables 3, 4, & 5: inputs set in `EF_calcs/inputs/inputs.xlsx` 
* Section 3.1 ANOVA result: `EF_comp/reports/stats.pdf`
* Figure 2: `EF_comp/plots/meas_EF_v_DM.png` 
* Section 3.2 summary of literature data: `lit_summary/output/var_summary.csv` 
* Table S1 and S2: `lit_summary/output/var_summary.csv` 
* Figure 3: `EF_calcs/plots/field_emis_factors.png` 
* Related values in section 3.3.1: `EF_calcs/output/field_EF_summ2.csv` 
* Figure 4:  `EF_calcs/plots/overall_emis_factors.png` 
* Section 3.3.2 discussion: `EF_calcs/output/EF_summ.csv` 
