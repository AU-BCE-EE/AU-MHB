# 2021-0294105_EFs
Calculation of select emission factors for NH3 loss from field-applied manure

# Overview of calculations
These calculations follow those in Aarhus University DCA report 2021-0251862 on emission factors (EFs), except for acidification.
The report is available from <https://www.researchgate.net/deref/https%3A%2F%2Fpure.au.dk%2Fportal%2Ffiles%2F223538048%2FEFreport23092021.pdf> and the calculations are described in detail at <https://github.com/sashahafner/ALFAM2-EF-DK-2021>.

## Acidification emission factor calculations
For acidification, the larger report used fixed pH values of 6.4 (field) and 6.0 (barn). 
In the present analysis, estimates were made based on the most recent regulation where acidification is described by a required acid dose.
According to <https://www.retsinformation.dk/eli/lta/2021/1551>, required acid doses are:

| Type of manure | Dose (kg/t)|
|----------------|------------|
|     Afgasset   |     11.0   |
|       Kvæg     |      3.0   |
|       Svin     |      2.9   |

The associated average pH value for each manure type was determined using the un-acidified pH values given in the larger EF report and the titration results.
For each titration curve, the change in pH (from initial) was determined by interpolation for the acid doses given above.
Mean values were then calculated by sample and finally manure type. 
For pig, two separate types of manure were analyzed in the titration experiments: slagtesvin and so-/smågrise.
And an average value was used here.
Results are given below.

| Type of manure | Dose (kg/t)| Un-acidified pH | Ave. pH change | Acidified pH |
|----------------|------------|-----------------|----------------|--------------|
|     Afgasset   |     11.0   |      7.9        |    -1.38       |   6.52       |
|       Kvæg     |      3.0   |      7.0        |    -0.53       |   6.47       |
|       Svin     |      2.9   |      7.2        |    -0.73       |   6.47       |

It is a coincidence that acidified pH values are identical for cattle and pig manure.

