# 2021-0294105_EFs
Calculation of select emission factors for NH3 loss from field-applied manure

# Overview of calculations
These calculations follow those in Hafner et al. (2021), except for model inputs for acidification.
The report is available from <https://pure.au.dk/portal/files/223538048/EFreport23092021.pdf> and the calculations are described in detail at <https://github.com/sashahafner/ALFAM2-EF-DK-2021>.

Briefly, the ALFAM2 model (v0.5.1 of the ALFAM2 R package, Hafner et al., 2020) was used with Parameter Set 2 to calculate cumulative NH3 emission after 168 hours.
Model inputs included manure dry matter (DM) and pH, average air temperature and wind speed, and application method.

## Acidification emission factor calculations
To account for acidification, the ALFAM2 model predicts the effect of manure pH on emission.
The larger report (Hafner et al., 2021) used a fixed pH value of 6.4 for field acidification.
In the current regulation, acidification extent is described by a required acid dose, and not a fixed pH value.
Required acid doses are given in the Table below.
To translate these doses into a fixed pH value for each manure type, a change in pH ($delta$pH) due to acidification was applied to average un-acidified manure pH for Denmark (7.0 for cattle, 7.2 for pig, and 7.9 for digestate from Hafner et al., 2021).
The $delta$pH value for the acid doses given above was determined using the titration measurements described in Nyord et al. (2021).
As described in the earlier report (Nyord et al., 2021), four types of manure samples were titrated with sulfuric acid.
In the present analysis $delta$pH (relative the initial pH value) resulting from the acid doses given above was determined by interpolation.
Mean $delta$pH values were calculated for all available samples: 11 afgasset, 8 kvæg, 7 slagtesvin, and 4 so-/smågrise samples.
Results from each sample were based on 2 measured titration curves from separate sub-samples.
For pig, an average value for the two types of manure was used here.
Results are given below.

| Type of manure | Dose (kg/t)| Un-acidified pH | Ave. pH change | Acidified pH |
|----------------|------------|-----------------|----------------|--------------|
|       Kvæg     |      3.0   |      7.0        |    -0.53       |   6.47       |
|       Svin     |      2.9   |      7.2        |    -0.73       |   6.47       |
|     Afgasset   |     11.0   |      7.9        |    -1.38       |   6.52       |
Notes: Acid doses are from <https://www.retsinformation.dk/eli/lta/2021/1551>.

It is a coincidence that acidified pH values are identical for cattle and pig manure.

# References
Hafner, 
Aarhus University DCA report 2021-0251862 on emission factors (EFs)

Nyord, T., Hafner, S.D., Adamsen, A.P.S., Sommer, S.G. 2021. Ammoniakfordampning fra forsuret gylle ved udbringning med slæbeslange. DCA - Nationalt Center for Fødevarer og Jordbrug Aarhus Universitet. Journal 2020-0188079. <https://pure.au.dk/portal/files/211563336/Forsuring_150221.pdf>
