# within group statistics, table of means and standard deviations
library(ISwR)
attach(red.cell.folate)
tapply(folate, ventilation, mean) # using tapply
# N2O+O2,24h  N2O+O2,op     O2,24h 
#   316.6250   256.4444   278.0000 

tapply(folate, ventilation, sd) 
# N2O+O2,24h  N2O+O2,op     O2,24h 
#   58.71709   37.12180   33.75648 

tapply(folate, ventilation, length)
# N2O+O2,24h  N2O+O2,op     O2,24h 
#          8          9          5 

# or a nicer display
xbar <- tapply(folate, ventilation, mean)
s <- tapply(folate, ventilation, sd)
n <- tapply(folate, ventilation, length)
cbind(mean = xbar, std.dev = s, n = n)
#                mean  std.dev n
# N2O+O2,24h 316.6250 58.71709 8
# N2O+O2,op  256.4444 37.12180 9
# O2,24h     278.0000 33.75648 5

# looking at the juul dataframe
juul <- transform(juul,
                  sex = factor(sex, labels = c("M", "F")),
                  menarche = factor(menarche, labels = c("No", "Yes")),
                  tanner = factor(tanner,
                                  labels = c("I", "II", "III", "IV", "V")))
attach(juul)

tapply(igf1, tanner, mean) # missing values
#   I  II III  IV   V 
#  NA  NA  NA  NA  NA 

tapply(igf1, tanner, mean, na.rm = T)
#        I       II      III       IV        V 
# 207.4727 352.6714 483.2222 513.0172 465.3344 

# aggregate and by are variations 
# aggregate works on the entire dataframe
aggregate(juul[c("age", "igf1")], list(sex = juul$sex), mean, na.rm = T)
#   sex      age     igf1
# 1   M 15.38436 310.8866
# 2   F 14.84363 368.1006

# the group argument is a list, dataframes can also be passed
aggregate(juul[c("age", "igf1")], juul["sex"], mean, na.rm = T)
#   sex      age     igf1
# 1   M 15.38436 310.8866
# 2   F 14.84363 368.1006

# by uses a sub data frame
by(juul, juul["sex"], summary)
# sex: M
#       age        menarche   sex          igf1        tanner       testvol      
#  Min.   : 0.17   No  :  0   M:621   Min.   : 29.0   I   :291   Min.   : 1.000  
#  1st Qu.: 8.85   Yes :  0   F:  0   1st Qu.:176.0   II  : 55   1st Qu.: 1.000  
#  Median :12.38   NA's:621           Median :280.0   III : 34   Median : 3.000  
#  Mean   :15.38                      Mean   :310.9   IV  : 41   Mean   : 7.896  
#  3rd Qu.:16.77                      3rd Qu.:430.2   V   :124   3rd Qu.:15.000  
#  Max.   :83.00                      Max.   :915.0   NA's: 76   Max.   :30.000  
#                                     NA's   :145                NA's   :141     
# ------------------------------------------------------------ 
# sex: F
#       age        menarche   sex          igf1        tanner       testvol   
#  Min.   : 0.25   No  :369   M:  0   Min.   : 25.0   I   :224   Min.   : NA  
#  1st Qu.: 9.30   Yes :335   F:713   1st Qu.:233.0   II  : 48   1st Qu.: NA  
#  Median :12.80   NA's:  9           Median :352.0   III : 38   Median : NA  
#  Mean   :14.84                      Mean   :368.1   IV  : 40   Mean   :NaN  
#  3rd Qu.:16.93                      3rd Qu.:483.0   V   :204   3rd Qu.: NA  
#  Max.   :75.12                      Max.   :914.0   NA's:159   Max.   : NA  
#                                     NA's   :176                NA's   :713  

