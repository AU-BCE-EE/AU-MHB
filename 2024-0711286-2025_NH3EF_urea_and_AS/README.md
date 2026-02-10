# 2025_3.42PA_NH3urea
Data and scripts for the Public Sector Consultancy memorandum: Ammonia emissions from urea and ammonium sulfate and the effect of injection and urease inhibitors under Danish conditions.
Link to memorandum: https://pure.au.dk/ws/files/422833250/Levering_Ammonia_emissions_from_urea_and_ammonium_sulfate_application.pdf

# Maintainer
Johanna Pedersen. Contact information here: https://www.researchgate.net/profile/Johanna-Pedersen 

# Overview
This repo contains all the data and data processing scripts for plots and data for tables in the memorandum.
The scripts run in R (<https://www.r-project.org/>) and require several add-on packages.
These packages are listed in multiple `packages.R` in `script-*` directories.

# Repo overview for folders with R scripts
See `scripts` for R scripts. 
`main.R` calls the other to do the complete data loading, subsetting, calculations, plotting, saving of data (in `output` subdirectory) and plots (in `plots` subdirectory). 

# Directory structure
## `incorp and inject`
### `data`
Database used for plots and summary. Subset from original data from Hutchings et al. (2026) (https://doi.org/10.1016/j.jclepro.2025.147438) and updated database (..._edit) with additional data from new studies (Götze et al. (2025) (https://doi.org/10.1016/j.agee.2024.109307) and Rochette et al., (2013) (doi:10.2134/jeq2013.05.0192)) and with the edition of 'set' identification coupling reference and incorporated fertilizer. 
### `output`
Summary of incorporation data
### `plots`
Plots showing data for incorporation. Script that produces the plots is in `scripts/plots.R`. 
### `scripts` 
R scripts for processing data on effect of incorporation or injection on ammonia emissions. 
`main.R` calls the others to do the complete dataload, subsetting, and save.

## `NH3 EF`
### `data`
Database used for plots and summary. Original data from Hutchings et al. (2026) (https://doi.org/10.1016/j.jclepro.2025.147438) and updated data (...EDIT) with data from Kemmann et al. (2025) (https://doi.org/10.1016/j.agee.2024.109416) included. 
### `output` 
Summary of incorporation data
### `plots`
Plots showing data for incorporation. Script that produces the plots is in `scripts/plots.R`. 
### `scripts`' 
R scripts for processing data on effect of incorporation or injection on ammonia emissions. 
`main.R` calls the others to do the complete dataload, subsetting, and save.
### `stats`
Summary of statistics. 

## `functions`
R functions used by various scripts. 

