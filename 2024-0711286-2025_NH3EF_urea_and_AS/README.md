# 2025_3.42PA_NH3urea
Data and scripts for the Public Sector Consultancy memorandum: Ammonia emissions from urea and ammonium sulfate and the effect of injection and urease inhibitors under Danish conditions.
Link to memorandum: XXXXX (will be added once published). 

# Maintainer
Johanna Pedersen. Contact information here: https://www.researchgate.net/profile/Johanna-Pedersen 

# Overview
This repo contains all the data and data processing scripts for plots and data for tables in the memorandum.
The scripts run in R (<https://www.r-project.org/>) and require several add-on packages.
These packages are listed in multiple `packages.R` in `script-*` directories.

# Repo overview for folders with R scripts
See `scripts` for R scripts. 
`main.R` calls the other to do the complete data loading, subsetting, calculations, plotting, saving of data (in `output` subdirectory) and plots (in `plots` subdirectory). 

# Important note on data 
The data used for the memorandum has been collected and used for a comprehensive statistical analysis which will be published as a peer-reviewed article in an international scientific journal at a later stage (Hutchings et al., in preparation). When published, the data will be publicly available through the Task Force on Emission Inventories and Projections (TFEIP) under United Nations Economic Commission for Europe (UNECE). When publicly available, the databased used for this memorandum will be uploaded to the `data` folders, and a new release of the repository will be made. 

# Directory structure
## `incorp and inject`
### `data`
Database used for plots and summary. Subset from original data from Hutchings et al. (in preparation) and updated databaser (..._edit) with additional data from new studies and with the edition of 'set' identification coupling reference and incorporated fertilizer. 
### `output`
Summary of incorporation data
### `plots`
Plots showing data for incorporation. Script that produces the plots is in `scripts/plots.R`. 
### `scripts` 
R scripts for processing data on effect of incorporation or injection on ammonia emissions. 
`main.R` calls the others to do the complete dataload, subsetting, and save.

## `NH3 EF`
### `data`
Database used for plots and summary. Original from Hutchings et al. (in preparation) and updated one (...EDIT) with data from Kemmann et al. (2025). 
### `output` 
Summary of incorporation data
### `plots`
Plots showing data for incorporation. Script that produces the plots is in `scripts/plots.R`. 
### `scripts`
R scripts for processing data on effect of incorporation or injection on ammonia emissions. 
`main.R` calls the others to do the complete dataload, subsetting, and save.
### `stats`
Summary of statistics. 

## `functions`
R functions used by various scripts. 

