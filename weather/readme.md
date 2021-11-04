# weather
These files are used to calculate mean air temperature, wind speed, and rainfall by decade x month (or season) for Denmark, based on daily values from 7 stations.

# Results
See `output/means.csv` or `output/means_season.csv` for calculated averages.
In the latter file, summer (sommer) is defined as May, June, and July, and autumn (efterår) is September only.

# Station details
Weather data were downloaded from <http://agro-web01t.uni.au.dk/klimadb/> under "Døgnværdier t.o.m. 2013" and "Døgnværdier fra 2014" on 1 November 2021.
All available variables were selected, and dates were 1 January 1980 through the latest available.
The list of locations used is given below, with the DMI station codes included.
All of these matches between station code and name are from DMI station list <https://confluence.govcloud.dk/pages/viewpage.action?pageId=41717704> unless given as AU list, in which case they are from <http://agro-web01t.uni.au.dk/klimadb/> under "Døgnværdier t.o.m. 2013", or "Døgnværdier fra 2014".

6019 Silstrup
6031 Tylstrup
6069 Foulum (confirmed with AU list)
6109 Askov (confirmed with AU list)
6116 Store Jyndevad (just "Jyndevad" on AU site under "t.o.m. 2013")
6126 Årslev
6135 Flakkebjerg

These are same numbers with additional 00.
601900 Silstrup
603100 Tylstrup
606900 Foulum
610900 Askov
612600 Årslev
613500 Flakkebjerg

611601 is given as "Jyndevad" (no "Store") on AU site "fra 2014".

# Missing values
Some observations are missing.
This undoubtedly contributes to imbalance and therefore some biases in resulting means.
For the 2010s decade, less than 2% of air temperature and wind speed observations are missing, but 5% of rain observations are missing.
(These values can be found in `output/frac_missing.csv`, and more details are given in `output/stat_counts.csv`.)
Because the number of missing observations is small, and because differences among stations are not large, any bias is likely small as well.
To minimize the effect of missing values, means were calculated by decade x month in a single step (see `scripts/means.R`).
An alternative--to calculate means first by decade x month x station--would increase the weight given to observations from incomplete subsets.

# Extreme values
Three rows in the file for Askov (station ID 6109) had implausibly high daily precipitation values (465-1068 mm).
These were excluded.

# Comparison to earlier work
The large report on Danish emission factors (Hafner et al., 2021) presents slightly different weather averages for the same 7 stations.
The earlier work had inadvertently excluded nearly all measurements from 2013.
Additional differences could be present in the downloaded files due to data revisions.

# References
Hafner, S. D., Nyord, T., Sommer, S. G., & Adamsen, A. P. S. 2021. Estimation of Danish emission factors for ammonia from field-applied liquid manure for 1980 to 2019.138 pages. Advisory report from DCA – Danish Centre for Food and Agriculture, Aarhus University, submitted: 23-09-2021. <https://pure.au.dk/portal/files/223538048/EFreport23092021.pdf>


