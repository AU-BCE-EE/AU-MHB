---
title: 'Stats'
output: pdf_document
author: Sasha D. Hafner
date: "16 August, 2022"
---

# LF vs. RS effect

Generates results for this statement:

```
In general, a clear reduction in the emission factors after application 
of the liquid fraction was found relative to application of the raw 
slurry (Figure 2) (p < 1·10-8 from F-test based on 2-factor ANOVA) . 
```


```r
dd <- subset(dat, frac.stud != 'mix')

mod <- lm(log10(EFp.field) ~ frac.stud.nm + interaction(source, set), data = dd)
anova(mod)
```

```
## Analysis of Variance Table
## 
## Response: log10(EFp.field)
##                          Df  Sum Sq Mean Sq F value    Pr(>F)    
## frac.stud.nm              1  1.6299 1.62993 41.9598 4.668e-09 ***
## interaction(source, set) 52 10.9074 0.20976  5.3998 1.338e-12 ***
## Residuals                91  3.5349 0.03885                      
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
coef(mod)[1:3]
```

```
##                                       (Intercept) 
##                                         0.9278041 
##                                    frac.stud.nmLF 
##                                        -0.2050109 
## interaction(source, set)Anderson et al, in prep.1 
##                                         0.5854482
```

```r
100 * (10^coef(mod)[1:3] - 1)
```

```
##                                       (Intercept) 
##                                         746.84543 
##                                    frac.stud.nmLF 
##                                         -37.62808 
## interaction(source, set)Anderson et al, in prep.1 
##                                         284.98892
```


```r
mod <- lm(log10(EFp.field) ~ DM, data = dd)
anova(mod)
```

```
## Analysis of Variance Table
## 
## Response: log10(EFp.field)
##            Df  Sum Sq Mean Sq F value  Pr(>F)  
## DM          1  0.6335 0.63349  5.8676 0.01667 *
## Residuals 143 15.4387 0.10796                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
summary(mod)
```

```
## 
## Call:
## lm(formula = log10(EFp.field) ~ DM, data = dd)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -1.8924 -0.1325  0.0366  0.2224  0.6345 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.14040    0.05566  20.490   <2e-16 ***
## DM           0.02526    0.01043   2.422   0.0167 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3286 on 143 degrees of freedom
## Multiple R-squared:  0.03942,	Adjusted R-squared:  0.0327 
## F-statistic: 5.868 on 1 and 143 DF,  p-value: 0.01667
```

# Compare EF vs. DM slopes for measurements and ALFAM2 predictions

CI on slope for measurements.


```r
mod1 <- lm(EFp.field ~ man.dm:source:set:man.source, data = dat)
summary(mod1)
```

```
## 
## Call:
## lm(formula = EFp.field ~ man.dm:source:set:man.source, data = dat)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -37.513  -7.325  -1.202   5.321  48.755 
## 
## Coefficients: (47 not defined because of singularities)
##                                                               Estimate
## (Intercept)                                                   19.97817
## man.dm:sourceAmon et al. (2006):set:man.sourceCattle          -2.42661
## man.dm:sourceAnderson et al, in prep:set:man.sourceCattle      0.90894
## man.dm:sourceBalsari et al. (2008a):set:man.sourceCattle            NA
## man.dm:sourceBalsari et al. (2008b):set:man.sourceCattle       2.82379
## man.dm:sourceBhandral et al. (2009):set:man.sourceCattle       0.45249
## man.dm:sourceChantigny et al. (2007):set:man.sourceCattle           NA
## man.dm:sourceChantigny et al. (2009):set:man.sourceCattle           NA
## man.dm:sourceDinuccio et al. (2011):set:man.sourceCattle      -0.39652
## man.dm:sourceDinuccio et al. (2012):set:man.sourceCattle            NA
## man.dm:sourceFangueiro et al. (2015):set:man.sourceCattle     -1.57856
## man.dm:sourceFrost et al. (1990):set:man.sourceCattle         -0.41599
## man.dm:sourceHjorth et al. (2009):set:man.sourceCattle              NA
## man.dm:sourceMonaco et al. (2012):set:man.sourceCattle              NA
## man.dm:sourceNyord (2018):set:man.sourceCattle                -0.41468
## man.dm:sourceNyord et al. (2012):set:man.sourceCattle               NA
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceCattle     1.39029
## man.dm:sourcePedersen et al. (2020):set:man.sourceCattle       1.77062
## man.dm:sourcePedersen et al. (2021):set:man.sourceCattle       0.02305
## man.dm:sourceSommer et al. (1991):set:man.sourceCattle         1.22117
## man.dm:sourceSommer et al. (2006):set:man.sourceCattle              NA
## man.dm:sourceStevens et al. (1992):set:man.sourceCattle        0.21594
## man.dm:sourceThompson et al. (1990):set:man.sourceCattle       2.19707
## man.dm:sourceVandre et al. (1997):set:man.sourceCattle         1.49769
## man.dm:sourceWagner et al. (2021):set:man.sourceCattle              NA
## man.dm:sourceAmon et al. (2006):set:man.sourceDigestate             NA
## man.dm:sourceAnderson et al, in prep:set:man.sourceDigestate        NA
## man.dm:sourceBalsari et al. (2008a):set:man.sourceDigestate         NA
## man.dm:sourceBalsari et al. (2008b):set:man.sourceDigestate         NA
## man.dm:sourceBhandral et al. (2009):set:man.sourceDigestate         NA
## man.dm:sourceChantigny et al. (2007):set:man.sourceDigestate        NA
## man.dm:sourceChantigny et al. (2009):set:man.sourceDigestate        NA
## man.dm:sourceDinuccio et al. (2011):set:man.sourceDigestate         NA
## man.dm:sourceDinuccio et al. (2012):set:man.sourceDigestate         NA
## man.dm:sourceFangueiro et al. (2015):set:man.sourceDigestate        NA
## man.dm:sourceFrost et al. (1990):set:man.sourceDigestate            NA
## man.dm:sourceHjorth et al. (2009):set:man.sourceDigestate      0.98165
## man.dm:sourceMonaco et al. (2012):set:man.sourceDigestate           NA
## man.dm:sourceNyord (2018):set:man.sourceDigestate                   NA
## man.dm:sourceNyord et al. (2012):set:man.sourceDigestate            NA
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceDigestate       NA
## man.dm:sourcePedersen et al. (2020):set:man.sourceDigestate         NA
## man.dm:sourcePedersen et al. (2021):set:man.sourceDigestate         NA
## man.dm:sourceSommer et al. (1991):set:man.sourceDigestate           NA
## man.dm:sourceSommer et al. (2006):set:man.sourceDigestate     -2.12257
## man.dm:sourceStevens et al. (1992):set:man.sourceDigestate          NA
## man.dm:sourceThompson et al. (1990):set:man.sourceDigestate         NA
## man.dm:sourceVandre et al. (1997):set:man.sourceDigestate           NA
## man.dm:sourceWagner et al. (2021):set:man.sourceDigestate     -1.04219
## man.dm:sourceAmon et al. (2006):set:man.sourcePig                   NA
## man.dm:sourceAnderson et al, in prep:set:man.sourcePig              NA
## man.dm:sourceBalsari et al. (2008a):set:man.sourcePig          2.03233
## man.dm:sourceBalsari et al. (2008b):set:man.sourcePig               NA
## man.dm:sourceBhandral et al. (2009):set:man.sourcePig               NA
## man.dm:sourceChantigny et al. (2007):set:man.sourcePig         0.17442
## man.dm:sourceChantigny et al. (2009):set:man.sourcePig         0.02669
## man.dm:sourceDinuccio et al. (2011):set:man.sourcePig               NA
## man.dm:sourceDinuccio et al. (2012):set:man.sourcePig          0.44133
## man.dm:sourceFangueiro et al. (2015):set:man.sourcePig              NA
## man.dm:sourceFrost et al. (1990):set:man.sourcePig                  NA
## man.dm:sourceHjorth et al. (2009):set:man.sourcePig            0.70118
## man.dm:sourceMonaco et al. (2012):set:man.sourcePig            0.81737
## man.dm:sourceNyord (2018):set:man.sourcePig                         NA
## man.dm:sourceNyord et al. (2012):set:man.sourcePig            -0.17688
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourcePig             NA
## man.dm:sourcePedersen et al. (2020):set:man.sourcePig               NA
## man.dm:sourcePedersen et al. (2021):set:man.sourcePig               NA
## man.dm:sourceSommer et al. (1991):set:man.sourcePig                 NA
## man.dm:sourceSommer et al. (2006):set:man.sourcePig                 NA
## man.dm:sourceStevens et al. (1992):set:man.sourcePig                NA
## man.dm:sourceThompson et al. (1990):set:man.sourcePig               NA
## man.dm:sourceVandre et al. (1997):set:man.sourcePig                 NA
## man.dm:sourceWagner et al. (2021):set:man.sourcePig                 NA
##                                                               Std. Error
## (Intercept)                                                      1.92574
## man.dm:sourceAmon et al. (2006):set:man.sourceCattle             1.73796
## man.dm:sourceAnderson et al, in prep:set:man.sourceCattle        1.20525
## man.dm:sourceBalsari et al. (2008a):set:man.sourceCattle              NA
## man.dm:sourceBalsari et al. (2008b):set:man.sourceCattle         0.68209
## man.dm:sourceBhandral et al. (2009):set:man.sourceCattle         0.17899
## man.dm:sourceChantigny et al. (2007):set:man.sourceCattle             NA
## man.dm:sourceChantigny et al. (2009):set:man.sourceCattle             NA
## man.dm:sourceDinuccio et al. (2011):set:man.sourceCattle         1.32858
## man.dm:sourceDinuccio et al. (2012):set:man.sourceCattle              NA
## man.dm:sourceFangueiro et al. (2015):set:man.sourceCattle        1.05391
## man.dm:sourceFrost et al. (1990):set:man.sourceCattle            0.21151
## man.dm:sourceHjorth et al. (2009):set:man.sourceCattle                NA
## man.dm:sourceMonaco et al. (2012):set:man.sourceCattle                NA
## man.dm:sourceNyord (2018):set:man.sourceCattle                   0.71472
## man.dm:sourceNyord et al. (2012):set:man.sourceCattle                 NA
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceCattle       1.68147
## man.dm:sourcePedersen et al. (2020):set:man.sourceCattle         0.57951
## man.dm:sourcePedersen et al. (2021):set:man.sourceCattle         0.18500
## man.dm:sourceSommer et al. (1991):set:man.sourceCattle           0.15003
## man.dm:sourceSommer et al. (2006):set:man.sourceCattle                NA
## man.dm:sourceStevens et al. (1992):set:man.sourceCattle          0.50437
## man.dm:sourceThompson et al. (1990):set:man.sourceCattle         1.59777
## man.dm:sourceVandre et al. (1997):set:man.sourceCattle           0.28087
## man.dm:sourceWagner et al. (2021):set:man.sourceCattle                NA
## man.dm:sourceAmon et al. (2006):set:man.sourceDigestate               NA
## man.dm:sourceAnderson et al, in prep:set:man.sourceDigestate          NA
## man.dm:sourceBalsari et al. (2008a):set:man.sourceDigestate           NA
## man.dm:sourceBalsari et al. (2008b):set:man.sourceDigestate           NA
## man.dm:sourceBhandral et al. (2009):set:man.sourceDigestate           NA
## man.dm:sourceChantigny et al. (2007):set:man.sourceDigestate          NA
## man.dm:sourceChantigny et al. (2009):set:man.sourceDigestate          NA
## man.dm:sourceDinuccio et al. (2011):set:man.sourceDigestate           NA
## man.dm:sourceDinuccio et al. (2012):set:man.sourceDigestate           NA
## man.dm:sourceFangueiro et al. (2015):set:man.sourceDigestate          NA
## man.dm:sourceFrost et al. (1990):set:man.sourceDigestate              NA
## man.dm:sourceHjorth et al. (2009):set:man.sourceDigestate        1.62664
## man.dm:sourceMonaco et al. (2012):set:man.sourceDigestate             NA
## man.dm:sourceNyord (2018):set:man.sourceDigestate                     NA
## man.dm:sourceNyord et al. (2012):set:man.sourceDigestate              NA
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceDigestate         NA
## man.dm:sourcePedersen et al. (2020):set:man.sourceDigestate           NA
## man.dm:sourcePedersen et al. (2021):set:man.sourceDigestate           NA
## man.dm:sourceSommer et al. (1991):set:man.sourceDigestate             NA
## man.dm:sourceSommer et al. (2006):set:man.sourceDigestate        1.35444
## man.dm:sourceStevens et al. (1992):set:man.sourceDigestate            NA
## man.dm:sourceThompson et al. (1990):set:man.sourceDigestate           NA
## man.dm:sourceVandre et al. (1997):set:man.sourceDigestate             NA
## man.dm:sourceWagner et al. (2021):set:man.sourceDigestate        1.31023
## man.dm:sourceAmon et al. (2006):set:man.sourcePig                     NA
## man.dm:sourceAnderson et al, in prep:set:man.sourcePig                NA
## man.dm:sourceBalsari et al. (2008a):set:man.sourcePig            1.35097
## man.dm:sourceBalsari et al. (2008b):set:man.sourcePig                 NA
## man.dm:sourceBhandral et al. (2009):set:man.sourcePig                 NA
## man.dm:sourceChantigny et al. (2007):set:man.sourcePig           0.56972
## man.dm:sourceChantigny et al. (2009):set:man.sourcePig           0.27772
## man.dm:sourceDinuccio et al. (2011):set:man.sourcePig                 NA
## man.dm:sourceDinuccio et al. (2012):set:man.sourcePig            1.36539
## man.dm:sourceFangueiro et al. (2015):set:man.sourcePig                NA
## man.dm:sourceFrost et al. (1990):set:man.sourcePig                    NA
## man.dm:sourceHjorth et al. (2009):set:man.sourcePig              2.84088
## man.dm:sourceMonaco et al. (2012):set:man.sourcePig              3.94383
## man.dm:sourceNyord (2018):set:man.sourcePig                           NA
## man.dm:sourceNyord et al. (2012):set:man.sourcePig               2.39951
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourcePig               NA
## man.dm:sourcePedersen et al. (2020):set:man.sourcePig                 NA
## man.dm:sourcePedersen et al. (2021):set:man.sourcePig                 NA
## man.dm:sourceSommer et al. (1991):set:man.sourcePig                   NA
## man.dm:sourceSommer et al. (2006):set:man.sourcePig                   NA
## man.dm:sourceStevens et al. (1992):set:man.sourcePig                  NA
## man.dm:sourceThompson et al. (1990):set:man.sourcePig                 NA
## man.dm:sourceVandre et al. (1997):set:man.sourcePig                   NA
## man.dm:sourceWagner et al. (2021):set:man.sourcePig                   NA
##                                                               t value Pr(>|t|)
## (Intercept)                                                    10.374  < 2e-16
## man.dm:sourceAmon et al. (2006):set:man.sourceCattle           -1.396  0.16499
## man.dm:sourceAnderson et al, in prep:set:man.sourceCattle       0.754  0.45210
## man.dm:sourceBalsari et al. (2008a):set:man.sourceCattle           NA       NA
## man.dm:sourceBalsari et al. (2008b):set:man.sourceCattle        4.140 6.16e-05
## man.dm:sourceBhandral et al. (2009):set:man.sourceCattle        2.528  0.01265
## man.dm:sourceChantigny et al. (2007):set:man.sourceCattle          NA       NA
## man.dm:sourceChantigny et al. (2009):set:man.sourceCattle          NA       NA
## man.dm:sourceDinuccio et al. (2011):set:man.sourceCattle       -0.298  0.76583
## man.dm:sourceDinuccio et al. (2012):set:man.sourceCattle           NA       NA
## man.dm:sourceFangueiro et al. (2015):set:man.sourceCattle      -1.498  0.13657
## man.dm:sourceFrost et al. (1990):set:man.sourceCattle          -1.967  0.05131
## man.dm:sourceHjorth et al. (2009):set:man.sourceCattle             NA       NA
## man.dm:sourceMonaco et al. (2012):set:man.sourceCattle             NA       NA
## man.dm:sourceNyord (2018):set:man.sourceCattle                 -0.580  0.56277
## man.dm:sourceNyord et al. (2012):set:man.sourceCattle              NA       NA
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceCattle      0.827  0.40983
## man.dm:sourcePedersen et al. (2020):set:man.sourceCattle        3.055  0.00272
## man.dm:sourcePedersen et al. (2021):set:man.sourceCattle        0.125  0.90105
## man.dm:sourceSommer et al. (1991):set:man.sourceCattle          8.139 2.60e-13
## man.dm:sourceSommer et al. (2006):set:man.sourceCattle             NA       NA
## man.dm:sourceStevens et al. (1992):set:man.sourceCattle         0.428  0.66924
## man.dm:sourceThompson et al. (1990):set:man.sourceCattle        1.375  0.17144
## man.dm:sourceVandre et al. (1997):set:man.sourceCattle          5.332 4.08e-07
## man.dm:sourceWagner et al. (2021):set:man.sourceCattle             NA       NA
## man.dm:sourceAmon et al. (2006):set:man.sourceDigestate            NA       NA
## man.dm:sourceAnderson et al, in prep:set:man.sourceDigestate       NA       NA
## man.dm:sourceBalsari et al. (2008a):set:man.sourceDigestate        NA       NA
## man.dm:sourceBalsari et al. (2008b):set:man.sourceDigestate        NA       NA
## man.dm:sourceBhandral et al. (2009):set:man.sourceDigestate        NA       NA
## man.dm:sourceChantigny et al. (2007):set:man.sourceDigestate       NA       NA
## man.dm:sourceChantigny et al. (2009):set:man.sourceDigestate       NA       NA
## man.dm:sourceDinuccio et al. (2011):set:man.sourceDigestate        NA       NA
## man.dm:sourceDinuccio et al. (2012):set:man.sourceDigestate        NA       NA
## man.dm:sourceFangueiro et al. (2015):set:man.sourceDigestate       NA       NA
## man.dm:sourceFrost et al. (1990):set:man.sourceDigestate           NA       NA
## man.dm:sourceHjorth et al. (2009):set:man.sourceDigestate       0.603  0.54722
## man.dm:sourceMonaco et al. (2012):set:man.sourceDigestate          NA       NA
## man.dm:sourceNyord (2018):set:man.sourceDigestate                  NA       NA
## man.dm:sourceNyord et al. (2012):set:man.sourceDigestate           NA       NA
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceDigestate      NA       NA
## man.dm:sourcePedersen et al. (2020):set:man.sourceDigestate        NA       NA
## man.dm:sourcePedersen et al. (2021):set:man.sourceDigestate        NA       NA
## man.dm:sourceSommer et al. (1991):set:man.sourceDigestate          NA       NA
## man.dm:sourceSommer et al. (2006):set:man.sourceDigestate      -1.567  0.11948
## man.dm:sourceStevens et al. (1992):set:man.sourceDigestate         NA       NA
## man.dm:sourceThompson et al. (1990):set:man.sourceDigestate        NA       NA
## man.dm:sourceVandre et al. (1997):set:man.sourceDigestate          NA       NA
## man.dm:sourceWagner et al. (2021):set:man.sourceDigestate      -0.795  0.42779
## man.dm:sourceAmon et al. (2006):set:man.sourcePig                  NA       NA
## man.dm:sourceAnderson et al, in prep:set:man.sourcePig             NA       NA
## man.dm:sourceBalsari et al. (2008a):set:man.sourcePig           1.504  0.13488
## man.dm:sourceBalsari et al. (2008b):set:man.sourcePig              NA       NA
## man.dm:sourceBhandral et al. (2009):set:man.sourcePig              NA       NA
## man.dm:sourceChantigny et al. (2007):set:man.sourcePig          0.306  0.75998
## man.dm:sourceChantigny et al. (2009):set:man.sourcePig          0.096  0.92359
## man.dm:sourceDinuccio et al. (2011):set:man.sourcePig              NA       NA
## man.dm:sourceDinuccio et al. (2012):set:man.sourcePig           0.323  0.74703
## man.dm:sourceFangueiro et al. (2015):set:man.sourcePig             NA       NA
## man.dm:sourceFrost et al. (1990):set:man.sourcePig                 NA       NA
## man.dm:sourceHjorth et al. (2009):set:man.sourcePig             0.247  0.80543
## man.dm:sourceMonaco et al. (2012):set:man.sourcePig             0.207  0.83613
## man.dm:sourceNyord (2018):set:man.sourcePig                        NA       NA
## man.dm:sourceNyord et al. (2012):set:man.sourcePig             -0.074  0.94135
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourcePig            NA       NA
## man.dm:sourcePedersen et al. (2020):set:man.sourcePig              NA       NA
## man.dm:sourcePedersen et al. (2021):set:man.sourcePig              NA       NA
## man.dm:sourceSommer et al. (1991):set:man.sourcePig                NA       NA
## man.dm:sourceSommer et al. (2006):set:man.sourcePig                NA       NA
## man.dm:sourceStevens et al. (1992):set:man.sourcePig               NA       NA
## man.dm:sourceThompson et al. (1990):set:man.sourcePig              NA       NA
## man.dm:sourceVandre et al. (1997):set:man.sourcePig                NA       NA
## man.dm:sourceWagner et al. (2021):set:man.sourcePig                NA       NA
##                                                                  
## (Intercept)                                                   ***
## man.dm:sourceAmon et al. (2006):set:man.sourceCattle             
## man.dm:sourceAnderson et al, in prep:set:man.sourceCattle        
## man.dm:sourceBalsari et al. (2008a):set:man.sourceCattle         
## man.dm:sourceBalsari et al. (2008b):set:man.sourceCattle      ***
## man.dm:sourceBhandral et al. (2009):set:man.sourceCattle      *  
## man.dm:sourceChantigny et al. (2007):set:man.sourceCattle        
## man.dm:sourceChantigny et al. (2009):set:man.sourceCattle        
## man.dm:sourceDinuccio et al. (2011):set:man.sourceCattle         
## man.dm:sourceDinuccio et al. (2012):set:man.sourceCattle         
## man.dm:sourceFangueiro et al. (2015):set:man.sourceCattle        
## man.dm:sourceFrost et al. (1990):set:man.sourceCattle         .  
## man.dm:sourceHjorth et al. (2009):set:man.sourceCattle           
## man.dm:sourceMonaco et al. (2012):set:man.sourceCattle           
## man.dm:sourceNyord (2018):set:man.sourceCattle                   
## man.dm:sourceNyord et al. (2012):set:man.sourceCattle            
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceCattle       
## man.dm:sourcePedersen et al. (2020):set:man.sourceCattle      ** 
## man.dm:sourcePedersen et al. (2021):set:man.sourceCattle         
## man.dm:sourceSommer et al. (1991):set:man.sourceCattle        ***
## man.dm:sourceSommer et al. (2006):set:man.sourceCattle           
## man.dm:sourceStevens et al. (1992):set:man.sourceCattle          
## man.dm:sourceThompson et al. (1990):set:man.sourceCattle         
## man.dm:sourceVandre et al. (1997):set:man.sourceCattle        ***
## man.dm:sourceWagner et al. (2021):set:man.sourceCattle           
## man.dm:sourceAmon et al. (2006):set:man.sourceDigestate          
## man.dm:sourceAnderson et al, in prep:set:man.sourceDigestate     
## man.dm:sourceBalsari et al. (2008a):set:man.sourceDigestate      
## man.dm:sourceBalsari et al. (2008b):set:man.sourceDigestate      
## man.dm:sourceBhandral et al. (2009):set:man.sourceDigestate      
## man.dm:sourceChantigny et al. (2007):set:man.sourceDigestate     
## man.dm:sourceChantigny et al. (2009):set:man.sourceDigestate     
## man.dm:sourceDinuccio et al. (2011):set:man.sourceDigestate      
## man.dm:sourceDinuccio et al. (2012):set:man.sourceDigestate      
## man.dm:sourceFangueiro et al. (2015):set:man.sourceDigestate     
## man.dm:sourceFrost et al. (1990):set:man.sourceDigestate         
## man.dm:sourceHjorth et al. (2009):set:man.sourceDigestate        
## man.dm:sourceMonaco et al. (2012):set:man.sourceDigestate        
## man.dm:sourceNyord (2018):set:man.sourceDigestate                
## man.dm:sourceNyord et al. (2012):set:man.sourceDigestate         
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceDigestate    
## man.dm:sourcePedersen et al. (2020):set:man.sourceDigestate      
## man.dm:sourcePedersen et al. (2021):set:man.sourceDigestate      
## man.dm:sourceSommer et al. (1991):set:man.sourceDigestate        
## man.dm:sourceSommer et al. (2006):set:man.sourceDigestate        
## man.dm:sourceStevens et al. (1992):set:man.sourceDigestate       
## man.dm:sourceThompson et al. (1990):set:man.sourceDigestate      
## man.dm:sourceVandre et al. (1997):set:man.sourceDigestate        
## man.dm:sourceWagner et al. (2021):set:man.sourceDigestate        
## man.dm:sourceAmon et al. (2006):set:man.sourcePig                
## man.dm:sourceAnderson et al, in prep:set:man.sourcePig           
## man.dm:sourceBalsari et al. (2008a):set:man.sourcePig            
## man.dm:sourceBalsari et al. (2008b):set:man.sourcePig            
## man.dm:sourceBhandral et al. (2009):set:man.sourcePig            
## man.dm:sourceChantigny et al. (2007):set:man.sourcePig           
## man.dm:sourceChantigny et al. (2009):set:man.sourcePig           
## man.dm:sourceDinuccio et al. (2011):set:man.sourcePig            
## man.dm:sourceDinuccio et al. (2012):set:man.sourcePig            
## man.dm:sourceFangueiro et al. (2015):set:man.sourcePig           
## man.dm:sourceFrost et al. (1990):set:man.sourcePig               
## man.dm:sourceHjorth et al. (2009):set:man.sourcePig              
## man.dm:sourceMonaco et al. (2012):set:man.sourcePig              
## man.dm:sourceNyord (2018):set:man.sourcePig                      
## man.dm:sourceNyord et al. (2012):set:man.sourcePig               
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourcePig          
## man.dm:sourcePedersen et al. (2020):set:man.sourcePig            
## man.dm:sourcePedersen et al. (2021):set:man.sourcePig            
## man.dm:sourceSommer et al. (1991):set:man.sourcePig              
## man.dm:sourceSommer et al. (2006):set:man.sourcePig              
## man.dm:sourceStevens et al. (1992):set:man.sourcePig             
## man.dm:sourceThompson et al. (1990):set:man.sourcePig            
## man.dm:sourceVandre et al. (1997):set:man.sourcePig              
## man.dm:sourceWagner et al. (2021):set:man.sourcePig              
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 11.9 on 132 degrees of freedom
## Multiple R-squared:  0.5293,	Adjusted R-squared:  0.4401 
## F-statistic: 5.937 on 25 and 132 DF,  p-value: 3.396e-12
```

```r
coef(mod1)
```

```
##                                                   (Intercept) 
##                                                   19.97817213 
##          man.dm:sourceAmon et al. (2006):set:man.sourceCattle 
##                                                   -2.42660883 
##     man.dm:sourceAnderson et al, in prep:set:man.sourceCattle 
##                                                    0.90893558 
##      man.dm:sourceBalsari et al. (2008a):set:man.sourceCattle 
##                                                            NA 
##      man.dm:sourceBalsari et al. (2008b):set:man.sourceCattle 
##                                                    2.82379450 
##      man.dm:sourceBhandral et al. (2009):set:man.sourceCattle 
##                                                    0.45248790 
##     man.dm:sourceChantigny et al. (2007):set:man.sourceCattle 
##                                                            NA 
##     man.dm:sourceChantigny et al. (2009):set:man.sourceCattle 
##                                                            NA 
##      man.dm:sourceDinuccio et al. (2011):set:man.sourceCattle 
##                                                   -0.39652137 
##      man.dm:sourceDinuccio et al. (2012):set:man.sourceCattle 
##                                                            NA 
##     man.dm:sourceFangueiro et al. (2015):set:man.sourceCattle 
##                                                   -1.57855796 
##         man.dm:sourceFrost et al. (1990):set:man.sourceCattle 
##                                                   -0.41598526 
##        man.dm:sourceHjorth et al. (2009):set:man.sourceCattle 
##                                                            NA 
##        man.dm:sourceMonaco et al. (2012):set:man.sourceCattle 
##                                                            NA 
##                man.dm:sourceNyord (2018):set:man.sourceCattle 
##                                                   -0.41467766 
##         man.dm:sourceNyord et al. (2012):set:man.sourceCattle 
##                                                            NA 
##    man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceCattle 
##                                                    1.39028655 
##      man.dm:sourcePedersen et al. (2020):set:man.sourceCattle 
##                                                    1.77062016 
##      man.dm:sourcePedersen et al. (2021):set:man.sourceCattle 
##                                                    0.02304795 
##        man.dm:sourceSommer et al. (1991):set:man.sourceCattle 
##                                                    1.22116577 
##        man.dm:sourceSommer et al. (2006):set:man.sourceCattle 
##                                                            NA 
##       man.dm:sourceStevens et al. (1992):set:man.sourceCattle 
##                                                    0.21594385 
##      man.dm:sourceThompson et al. (1990):set:man.sourceCattle 
##                                                    2.19706768 
##        man.dm:sourceVandre et al. (1997):set:man.sourceCattle 
##                                                    1.49768774 
##        man.dm:sourceWagner et al. (2021):set:man.sourceCattle 
##                                                            NA 
##       man.dm:sourceAmon et al. (2006):set:man.sourceDigestate 
##                                                            NA 
##  man.dm:sourceAnderson et al, in prep:set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourceBalsari et al. (2008a):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourceBalsari et al. (2008b):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourceBhandral et al. (2009):set:man.sourceDigestate 
##                                                            NA 
##  man.dm:sourceChantigny et al. (2007):set:man.sourceDigestate 
##                                                            NA 
##  man.dm:sourceChantigny et al. (2009):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourceDinuccio et al. (2011):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourceDinuccio et al. (2012):set:man.sourceDigestate 
##                                                            NA 
##  man.dm:sourceFangueiro et al. (2015):set:man.sourceDigestate 
##                                                            NA 
##      man.dm:sourceFrost et al. (1990):set:man.sourceDigestate 
##                                                            NA 
##     man.dm:sourceHjorth et al. (2009):set:man.sourceDigestate 
##                                                    0.98165087 
##     man.dm:sourceMonaco et al. (2012):set:man.sourceDigestate 
##                                                            NA 
##             man.dm:sourceNyord (2018):set:man.sourceDigestate 
##                                                            NA 
##      man.dm:sourceNyord et al. (2012):set:man.sourceDigestate 
##                                                            NA 
## man.dm:sourceOwusu-Twum et al. (2017):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourcePedersen et al. (2020):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourcePedersen et al. (2021):set:man.sourceDigestate 
##                                                            NA 
##     man.dm:sourceSommer et al. (1991):set:man.sourceDigestate 
##                                                            NA 
##     man.dm:sourceSommer et al. (2006):set:man.sourceDigestate 
##                                                   -2.12257262 
##    man.dm:sourceStevens et al. (1992):set:man.sourceDigestate 
##                                                            NA 
##   man.dm:sourceThompson et al. (1990):set:man.sourceDigestate 
##                                                            NA 
##     man.dm:sourceVandre et al. (1997):set:man.sourceDigestate 
##                                                            NA 
##     man.dm:sourceWagner et al. (2021):set:man.sourceDigestate 
##                                                   -1.04219486 
##             man.dm:sourceAmon et al. (2006):set:man.sourcePig 
##                                                            NA 
##        man.dm:sourceAnderson et al, in prep:set:man.sourcePig 
##                                                            NA 
##         man.dm:sourceBalsari et al. (2008a):set:man.sourcePig 
##                                                    2.03233187 
##         man.dm:sourceBalsari et al. (2008b):set:man.sourcePig 
##                                                            NA 
##         man.dm:sourceBhandral et al. (2009):set:man.sourcePig 
##                                                            NA 
##        man.dm:sourceChantigny et al. (2007):set:man.sourcePig 
##                                                    0.17441575 
##        man.dm:sourceChantigny et al. (2009):set:man.sourcePig 
##                                                    0.02668688 
##         man.dm:sourceDinuccio et al. (2011):set:man.sourcePig 
##                                                            NA 
##         man.dm:sourceDinuccio et al. (2012):set:man.sourcePig 
##                                                    0.44133438 
##        man.dm:sourceFangueiro et al. (2015):set:man.sourcePig 
##                                                            NA 
##            man.dm:sourceFrost et al. (1990):set:man.sourcePig 
##                                                            NA 
##           man.dm:sourceHjorth et al. (2009):set:man.sourcePig 
##                                                    0.70117562 
##           man.dm:sourceMonaco et al. (2012):set:man.sourcePig 
##                                                    0.81736561 
##                   man.dm:sourceNyord (2018):set:man.sourcePig 
##                                                            NA 
##            man.dm:sourceNyord et al. (2012):set:man.sourcePig 
##                                                   -0.17688467 
##       man.dm:sourceOwusu-Twum et al. (2017):set:man.sourcePig 
##                                                            NA 
##         man.dm:sourcePedersen et al. (2020):set:man.sourcePig 
##                                                            NA 
##         man.dm:sourcePedersen et al. (2021):set:man.sourcePig 
##                                                            NA 
##           man.dm:sourceSommer et al. (1991):set:man.sourcePig 
##                                                            NA 
##           man.dm:sourceSommer et al. (2006):set:man.sourcePig 
##                                                            NA 
##          man.dm:sourceStevens et al. (1992):set:man.sourcePig 
##                                                            NA 
##         man.dm:sourceThompson et al. (1990):set:man.sourcePig 
##                                                            NA 
##           man.dm:sourceVandre et al. (1997):set:man.sourcePig 
##                                                            NA 
##           man.dm:sourceWagner et al. (2021):set:man.sourcePig 
##                                                            NA
```

```r
cc <- coef(mod1)[-1]
hist(cc, breaks = 15)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)

```r
range(na.omit(cc))
```

```
## [1] -2.426609  2.823794
```

```r
t.test(cc)
```

```
## 
## 	One Sample t-test
## 
## data:  cc
## t = 1.4039, df = 24, p-value = 0.1732
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -0.1711586  0.8993183
## sample estimates:
## mean of x 
## 0.3640798
```

Model slope.


```r
mod2 <- lm(EFp.field ~ man.dm:man.source, data = a2dat)
summary(mod2)
```

```
## 
## Call:
## lm(formula = EFp.field ~ man.dm:man.source, data = a2dat)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -5.8077 -0.3653  0.0463  0.3422  5.6849 
## 
## Coefficients:
##                            Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                 8.27671    0.16355   50.60   <2e-16 ***
## man.dm:man.sourceCattle     2.90591    0.04197   69.24   <2e-16 ***
## man.dm:man.sourceDigestate  4.19672    0.04179  100.43   <2e-16 ***
## man.dm:man.sourcePig        1.87560    0.07741   24.23   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.9885 on 851 degrees of freedom
## Multiple R-squared:  0.9711,	Adjusted R-squared:  0.971 
## F-statistic:  9534 on 3 and 851 DF,  p-value: < 2.2e-16
```

```r
coef(mod2)
```

```
##                (Intercept)    man.dm:man.sourceCattle 
##                   8.276710                   2.905905 
## man.dm:man.sourceDigestate       man.dm:man.sourcePig 
##                   4.196725                   1.875598
```

