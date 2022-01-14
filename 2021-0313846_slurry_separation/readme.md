# 2021-0313846_slurry_separation
Assessment of the effect of slurry separation on ammonia loss

# Overview
This task was intended to quantitatively assess the effect of liquid/solid separation of animal slurry on subsequent ammonia loss, primarily after field application.
This repository contains literature data extracted from publications, which were summarized in order to understand the likely performance of separation, in particular, the magnitude of the reduction in dry matter (in the liquid fraction compared to the original, raw, slurry) and the partitioning of total ammonical nitrogen (TAN) mass between liquid and solid fractions (the separation efficiency).
Also included are model-based estimates of overall ammonia loss from slurry management chains with and without separation.
For details, see the subdirectories described below.

# Repeating calculations
Calculations can be repeated in R by running the script within each subdirectory named `scripts/main.R`.
Where relevant, the `logs` directory has a log of the ALFAM2 model call, which can be used to confirm package version and parameter values.
All calculations here were based on version 1.5.1 of the ALFAM2 package, using Parameter Set 2 (default).
Where relevant, inputs are specified in the `inputs` directory.
Add-on packages needed for running the scripts are listed in the `scripts/packages.R` files.

# `ALFAM2_data`
Graphical exploration of measurements in the ALFAM2 database, and ALFAM2 model predictions.
Both were related to a paricular problem in this work: that both database and model are weak with respect to manure with a high solids content.
None of these results were included in the order memo, but they support the approach used for estimation of emission factors.

Plots of measurements (particularly `plots/emis_v_DM.png`) confirm that high emission factors for high dry matter manure is possible, and suggest emission *may* actually decline at dry matter contents above around 20% (although few measurements are available).
The model was developed with measurements from slurry with no more than 15% DM, so should not be expected to be accurate, but model predictions show that peak emission occurs at a dry matter content between 10 and 15% for the inputs selected.  
(The curves shown in `plots/emis_v_DM.png` are model predictions.)

Other plots provide evidence that emission does in fact tend to increase with dry matter (`plots/emis_v_DM_lines.png`) or may have a tendency to decline at high dry matter.

# `DATAMAN`
Some plots of measurements from the DATAMAN database, excluding observations originally taken from ALFAM2.
Data frome: <https://dataman.azurewebsites.net/DataManFields>
Storage seems empty; these data are from field application only.
Two filtering operations: 
1. manure treatment = separation
2. manure type = farmyard manure (FYM), slurry, solid manure, dung
These correspond to subdirectories `1_separated` and `2_more`.
