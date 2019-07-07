# to compute marginal tables, the sums of the counts
# along one or the other dimension of a table using margin.table

library(ISwR)
juul <- transform(juul,
                  sex = factor(sex, labels = c("M", "F")),
                  menarche = factor(menarche, labels = c("No", "Yes")),
                  tanner = factor(tanner,
                                  labels = c("I", "II", "III", "IV", "V")))
attach(juul)

tanner.sex <- table(tanner, sex)
#       sex
# tanner   M   F
#    I   291 224
#    II   55  48
#    III  34  38
#    IV   41  40
#    V   124 204

# and compute margin tables
margin.table(tanner.sex, 1) # index 1 for rows
# tanner
#   I  II III  IV   V 
# 515 103  72  81 328 
margin.table(tanner.sex, 2) # index 2 for columns
# sex
#   M   F 
# 545 554 

# relative frequencies expressed as proportions of row or column totals
prop.table(tanner.sex, 1)
#       sex
# tanner         M         F
#    I   0.5650485 0.4349515
#    II  0.5339806 0.4660194
#    III 0.4722222 0.5277778
#    IV  0.5061728 0.4938272
#    V   0.3780488 0.6219512

# rows for each index sum to 1, and multipled by 100 would give percents

# for relative proportions to the total of the table use
tanner.sex / sum(tanner.sex)
#       sex
# tanner          M          F
#    I   0.26478617 0.20382166
#    II  0.05004550 0.04367607
#    III 0.03093722 0.03457689
#    IV  0.03730664 0.03639672
#    V   0.11282985 0.18562329

# margin.table and prop.table also work on multiway tables
# with margin as an argument vector for relevant margins, 2d or more
