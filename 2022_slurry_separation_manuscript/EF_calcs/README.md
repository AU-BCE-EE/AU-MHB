# `EF_calcs`
Calculation of *overall* (storage and application) emission factors given some assumptions about separation.
See `../README.md` for additional information.

# Organization
Inputs are set in `inputs`.
See `plots` for main output.
Inputs on separation performance (dry matter reduction and change in pH (liquid vs. raw), and TAN separation efficiency) come from the literature data in `lit_summary/output`.

# Approach
The current approach evaluates uncertainty in the mean overall emission factors (EFs) based on variability in reported separation performance.
Uncertainty is not considered for any other inputs.

A classical parametric approach is used to estimate a 95% confidence interval in the mean overall emission factors for each combination of inputs (manure source, timing, application method).
To do this, the literature performance data are combined with input combinations by manure source.
Dry matter (DM) reduction and pH change from each observation are applied to raw slurry values to generate inputs for the ALFAM2 model, which is then used to calculate field application EFs for each literature observation.
This results in some tens of field EF predictions for liquid and solid fractions for each manure source x timing x application method combination.
These field EFs are combined with storage EFs (those used for Danish inventory calculations) to calculate overall EFs.
This combination requires a value for total ammonical nitrogen (TAN) separation efficiency, which is taken from the same literature observation that supplied the DM and pH change values.

This procedure results in tens of overall EF predictions for each combination of inputs (manure source, timing, application method) (except reference, where separation is not included).
These values are used to calculate an overall mean and confidence interval for each combination of inputs.

The main advantage of this approach as compared to manual selection of lower and upper limits to input variables is that we account for any correlation between variables (e.g., DM reduction tends to be correlated with separation efficiency) and do not need to try to sort out joint distributions based on theory.
Sampling from the literature data sorts this out for us.

Typically a confidence interval provides an range within which the "true" mean response is likely to be.
This applies here, but only given the assumptions that all other inputs apart from the separation performance data have no error.

# Plots
The plot `plots/overall_emis_factors.png` shows mean values (points) plus a 95% confidence interval (error bars), as well as minimum and maximum estimates from individual literature observations (light error bars without horizontal ends). 
