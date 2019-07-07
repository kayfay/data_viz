# insert a value between two elements of a vector at a 
# given position by using the append function (use the
# help system to find out). Without append, how would
# would you do it?

append(1:4, 0:1, after = 2)

n1234 <- c(1:4)
n120134 <- c(n1234[1:2], 0, 1, n1234[3:4])

# write the built-in data set thuesen to a tab-seperated
# text file with write.table. view it with a text editor
# (depending on your system). Change the NA value to .
# (peroid), and read the changed file back into R with a
# suitable command. Also try importing the data into 
# other applications of your choice and export them to a
# new file after editing. You may have to remove row 
# names to make this work.

data(thuesen, package = "ISwR")
write.table(thue, thuesen.txt, sep = "\t")

read.table(file = "thuesen.txt", header = TRUE, sep = "\t", na.strings = ".")

library(foreign)
read.dbf(file = "thuesen.dbf")
