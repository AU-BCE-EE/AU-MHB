---
title: 'Stats on LF vs. RS effect'
output: pdf_document
author: Sasha D. Hafner
date: "31 May, 2022"
---


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
