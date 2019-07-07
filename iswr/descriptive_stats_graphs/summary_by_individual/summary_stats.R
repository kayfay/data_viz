x <- rnorm(50)

mean(x)
# [1] 0.03998022
sd(x)
# [1] 0.98614
var(x)
# [1] 0.9724722
median(x)
# [1] 0.1075329

quantile(x)
#         0%        25%        50%        75%       100% 
# -2.4995722 -0.4823323  0.1075329  0.6923758  2.1505247 

# quartiles .25 .50 .75
# centiles, percentiles .1 .2., ..., .9
# interquartile range (IQR) and sometimes is used as a robust 
# standard deviation

# to get deciles
pvec <- seq(0, 1, 0.1)
#  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

quantile(x, pvec)
#         0%        10%        20%        30%        40%        50%        60% 
# -2.4995722 -1.0769279 -0.6029757 -0.4000907 -0.2331301  0.1075329  0.3709178 
#        70%        80%        90%       100% 
#  0.6684222  0.8275864  1.1675362  2.1505247 

# quantile used by R is based on sum polygons where the ith ranking
# observation is the (i - 1) / (n - 1) quantile and intermediate 
# quantiles are obtained by linear interpolation

library(ISwR)
attach(juul)

mean(igf1, na.rm = T)
# [1] 340.168

# length (count logical TRUE values as 1)
sum(!is.na(igf1))
# [1] 1018

# summary display of numeric variables
summary(igf1)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#    25.0   202.2   313.5   340.2   462.8   915.0     321 

# summarize an entire dataframe
summary(juul)
#       age            menarche          sex             igf1      
#  Min.   : 0.170   Min.   :1.000   Min.   :1.000   Min.   : 25.0  
#  1st Qu.: 9.053   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:202.2  
#  Median :12.560   Median :1.000   Median :2.000   Median :313.5  
#  Mean   :15.095   Mean   :1.476   Mean   :1.534   Mean   :340.2  
#  3rd Qu.:16.855   3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:462.8  
#  Max.   :83.000   Max.   :2.000   Max.   :2.000   Max.   :915.0  
#  NA's   :5        NA's   :635     NA's   :5       NA's   :321    
#      tanner        testvol      
#  Min.   :1.00   Min.   : 1.000  
#  1st Qu.:1.00   1st Qu.: 1.000  
#  Median :2.00   Median : 3.000  
#  Mean   :2.64   Mean   : 7.896  
#  3rd Qu.:5.00   3rd Qu.:15.000  
#  Max.   :5.00   Max.   :30.000  
#  NA's   :240    NA's   :859     

# menarch, sex, and tanner are coded as numerics and can be 
# recode as categorical variables
detach(juul)
# <environment: 0x556b3e464cd0>
# attr(,"name")
# [1] "juul"

juul$sex <- factor(juul$sex, labels = c("M", "F"))
#    [1] <NA> <NA> <NA> <NA> <NA> M    M    M    M    M    M    M    M    M   
# ...
# [1331] F    F    F    F    F    F    F    F    F   
# Levels: M F

juul$menarche <- factor(juul$menarche, labels = c("No", "Yes"))
#    [1] <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA> <NA>
# ...
# [1331] Yes  Yes  Yes  Yes  Yes  Yes  Yes  Yes  Yes 
# Levels: No Yes

juul$tanner <- factor(juul$tanner,
                      labels = c("I", "II", "III", "IV", "V"))
#    [1] <NA> <NA> <NA> <NA> <NA> I    I    I    I    I    I    I    I    I   
# ...
# [1331] <NA> <NA> <NA> V    V    <NA> <NA> <NA> <NA>
# Levels: I II III IV V

attach(juul)
# <environment: 0x556b3e8322f8>
# attr(,"name")
# [1] "juul"

summary(juul)
#       age         menarche     sex           igf1        tanner   
#  Min.   : 0.170   No  :369   M   :621   Min.   : 25.0   I   :515  
#  1st Qu.: 9.053   Yes :335   F   :713   1st Qu.:202.2   II  :103  
#  Median :12.560   NA's:635   NA's:  5   Median :313.5   III : 72  
#  Mean   :15.095                         Mean   :340.2   IV  : 81  
#  3rd Qu.:16.855                         3rd Qu.:462.8   V   :328  
#  Max.   :83.000                         Max.   :915.0   NA's:240  
#  NA's   :5                              NA's   :321               
#     testvol         
#  Min.   : 1.000     
#  1st Qu.: 1.000     
#  Median : 3.000     
#  Mean   : 7.896             
#  3rd Qu.:15.000             
#  Max.   :30.000             
#  NA's   :859                

# using transform (or within) to convert variables to factors with levels
juul <- transform(juul,
                  sex = factor(sex, labels = c("M", "F")),
                  menarche = factor(menarche, labels = c("No", "Yes")),
                  tanner = factor(tanner,
                                  labels = c("I", "II", "III", "IV", "V")))
