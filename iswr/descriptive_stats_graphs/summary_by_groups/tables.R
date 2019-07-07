# catagorical data are usualy described in tables

# two-way tables taken in as a matrix
# caffine consumption by marital status
dat.mat <- c(652, 1537, 598, 242, 36, 46, 38, 21, 218, 327, 106, 67)
caff.marital <- matrix(dat.mat, nrow = 3, byrow = T)
#      [,1] [,2] [,3] [,4]
# [1,]  652 1537  598  242
# [2,]   36   46   38   21
# [3,]  218  327  106   67

# default is by column, specified by row with ncol specified

# setting row and column names for readable printout
colnames(caff.marital) <- c("0", "1-150", "151-300", ">300")
rownames(caff.marital) <- c("Married", "Prev.married", "Single")

# and naming the row and columns
names(dimnames(caff.marital)) <- c("marital", "consumption")
caff.marital
#               consumption
# marital          0 1-150 151-300 >300
#   Married      652  1537     598  242
#   Prev.married  36    46      38   21
#   Single       218   327     106   67

# table class also exists with special methods
as.table(caff.marital)
#               consumption
# marital           0 1-150 151-300 >300
#   Married       652  1537     598  242
#   Prev.married   36    46      38   21
#   Single        218   327     106   67

# converting as a dataframe
as.data.frame(as.table(caff.marital))
#         marital consumption Freq
# 1       Married           0  652
# 2  Prev.married           0   36
# 3        Single           0  218
# 4       Married       1-150 1537
# 5  Prev.married       1-150   46
# 6        Single       1-150  327
# 7       Married     151-300  598
# 8  Prev.married     151-300   38
# 9        Single     151-300  106
# 10      Married        >300  242
# 11 Prev.married        >300   21
# 12       Single        >300   67

# when using dataframes tabulation options are, table, xtabs, ftable
# for tabulating numeric vectors and factor variables

# looking at the juul dataframe
library(ISwR)
juul <- transform(juul,
                  sex = factor(sex, labels = c("M", "F")),
                  menarche = factor(menarche, labels = c("No", "Yes")),
                  tanner = factor(tanner,
                                  labels = c("I", "II", "III", "IV", "V")))
attach(juul)

table(sex)
# sex
#   M   F 
# 621 713 

table(sex, menarche)
#    menarche
# sex  No Yes
#   M   0   0
#   F 369 335

table(menarche, tanner) # stages of puberty
#         tanner
# menarche   I  II III  IV   V
#      No  221  43  32  14   2
#      Yes   1   1   5  26 202

# a multitable table(factor1, factor2, factor3)
# a table of cell counts uses the array function

# xtabs uses a model formula interface
xtabs( ~ tanner + sex, data = juul)
#       sex
# tanner   M   F
#    I   291 224
#    II   55  48
#    III  34  38
#    IV   41  40
#    V   124 204

# comparing multiway xtables to ftable
xtabs( ~ dgn + diab + coma, data = stroke)
# , , coma = No
# 
#      diab
# dgn    No Yes
#   ICH  53   6
#   ID  143  21
#   INF 411  64
#   SAH  38   0
# 
# , , coma = Yes
# 
#      diab
# dgn    No Yes
#   ICH  19   1
#   ID   23   3
#   INF  23   2
#   SAH   9   0
# 

ftable(coma + diab ~ dgn, data = stroke)
#     coma  No     Yes    
#     diab  No Yes  No Yes
# dgn                     
# ICH       53   6  19   1
# ID       143  21  23   3
# INF      411  64  23   2
# SAH       38   0   9   0

# transposing with the t function
t(caff.marital)
#            marital
# consumption Married Prev.married Single
#     0           652           36    218
#     1-150      1537           46    327
#     151-300     598           38    106
#     >300        242           21     67

# and generalized transposition of multiway tables
# or by exchanging the indices use aperm
aperm(ftable(coma + diab ~ dgn, data = stroke))
#      [,1] [,2] [,3] [,4]
# [1,]   53  143  411   38
# [2,]    6   21   64    0
# [3,]   19   23   23    9
# [4,]    1    3    2    0
