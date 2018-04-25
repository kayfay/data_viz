library('gtable')
library('gridExtra')
library('grid')

# Create a measure dataframe to work with
measure <-  structure(list(V1 = 1:20,
                             V2 = c(34L, 37L, 38L, 36L, 38L, 43L, 40L, 38L, 40L, 41L,
                                    36L, 36L, 34L, 33L, 36L, 37L, 34L, 36L, 38L, 35L),
                             V3 = c(30L, 32L, 30L, 33L, 29L, 32L, 33L, 30L, 30L, 32L,
                                    24L, 25L, 24L, 22L, 26L, 26L, 25L, 26L, 28L, 23L),
                             V4 = c(32L, 37L, 36L, 39L, 33L, 38L, 42L, 40L, 37L, 39L,
                                    35L, 37L, 37L, 34L, 38L, 37L, 38L, 37L, 40L, 35L)),
                        .Names = c("V1", "V2", "V3", "V4"),
                        class = "data.frame", row.names = c(NA, -20L))
measure <- measure[, -1]
names(measure) <- c("chest", "waist", "hips")
measure$gender <- gl(2, 10)
levels(measure$gender) <- c("male", "female")

# Subset of female and male
f <- subset(measure, gender == 'female')[, c('chest', 'waist', 'hips')]
m <- subset(measure, gender == 'male')[, c('chest','waist', 'hips')]

# Subsets of female and male covariances
measure.female.covariance <- round(cov(f), digits = 2)
measure.male.covariance <- round(cov(m), digits = 2)

# Selects a cell to highlight
find_cell <- function(table, row, col, name = "core-fg") {
    l <- table$layout
    which(l$t == row & l$l == col & l$name == name)
}

# Add a title to a table
t.table <- function(table, ttext) {
    title <- textGrob(ttext, gp=gpar(fontsize=16))
    padding <- unit(0.5, "line")
    table <- gtable_add_rows(table,
                         heights = grobHeight(title) + padding,
                         pos = 0)
    table <- gtable_add_grob(
                             table, list(title),
                             t = 1, l = 1, r = ncol(table))

}
# Dataset displayed as table
mes.t <- tableGrob(rbind(m,f))
mes.t <- gtable_add_rows(mes.t, unit(1, 'cm'), pos = 1)
mes.t <- gtable_add_rows(mes.t, unit(1, 'cm'), pos = 12)
grid.draw(mes.t)

# Female and male covariance tables
f.cov <- tableGrob(as.table(measure.female.covariance))
ind <- find_cell(f.cov, 2, 2, "core-bg")
f.cov$grobs[ind][[1]][["gp"]] <- gpar(fill = "lightgrey", col = "darkgrey", lwd=5)

m.cov <- tableGrob(as.table(measure.male.covariance))
ind <- find_cell(m.cov, 2, 2, "core-bg")
m.cov$grobs[ind][[1]][["gp"]] <- gpar(fill = "lightgrey", col = "darkgrey", lwd=5)

grid.arrange(
    t.table(m.cov, c('Males')),
    t.table(f.cov, c('Females')),
    ncol = 2)


