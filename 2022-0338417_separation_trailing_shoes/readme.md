# `2022-0338417_separation_trailing_shoes`
Field emission of ammonia from digestate for several application method x dry matter x pH x application timing combinations

# Overview
This task is a follow-up to `2021-0313846_slurry_separation`, which was intended to quantitatively assess the effect of liquid/solid separation of animal slurry on subsequent ammonia loss, primarily after field application.
In the present task, ammonia emission from field-applied digestate was calculated using the ALFAM2 model (v2.0) for 160 combinations of application method, digestate dry matter, digestate pH, and application timing.
The work in this task is simpler than the previous one.
For details, see the subdirectories described below.

# Calculations
Emission factors can be re-calculated in R by running the `scripts/main.R` script.
All calculations here were based on version 2.0 of the ALFAM2 package, using Parameter Set 2 (default).
The `logs` directory has a log of the ALFAM2 model call, which can be used to confirm package version and parameter values.
Add-on packages needed for running the scripts are listed in the `scripts/packages.R` files.
See the `logs/versions.txt` files for package (and R) versions (typically not important).

# Inputs
Inputs are specified in the `inputs/inputs.xlsx` file.
There are five worksheets in this file, related to the five factors that were varied, with an additional sheet for slurry type or source (fixed at digestate here). 
The `scripts/prep.R` script creates all 160 combinations of levels from these inputs.

Weather inputs for model calculations were specified in the original order, and were the same as those used in earlier tasks (and reported in earlier memos/reports). 
Values are adjusted means for the decade 2010-2019.
For details on the original source, see the `../weather` directory, which includes a `readme.md` file explaining data sources and calculations in some detail.
Summer was defined as June, July, and August for all emission factors.

# Output
The file `output/EF_table.csv` has the calculated emission factors (EFs) given in Table 1 in the memo associated with this order (see `../readme.md` for the link to the memo).
These same data are shown grapically in the png files in `plots`.
All EFs are also given in `output/EF.csv`, with one EF per row.
The file `output/preds.csv` has all output from the ALFAM2 model call, including a dummy variable for application method.
