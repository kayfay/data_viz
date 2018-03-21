# Original Source: http://motioninsocial.com/tufte/#introduction
# Tufte in R Lukasz Piwek

# Marginal histogram scatterplot in base graphics with fancyaxis
# http://www.cl.cam.ac.uk/~sjm217/projects/graphics/

# Edward Tufte, The Visual Display of Quantitative Information (Cheshire, 1983), p. 133.
# Steven Murdoch’s GitHub axisstripchart creates a marginal dot-histograms, although with limited customisation.

library(devtools)
source_url("https://raw.githubusercontent.com/sjmurdoch/fancyaxis/master/fancyaxis.R")
x <- faithful$waiting
y <- faithful$eruptions
plot(x, y, main=NULL, axes=FALSE, pch=16, cex=0.8,
     xlab="Time till next eruption (min)",
     ylab="Duration (sec)",
     xlim=c(min(x)/1.1, max(x)),
     ylim=c(min(y)/1.5, max(y)))
axis(1, tick=F)
axis(2, tick=F, las=2)
axisstripchart(faithful$waiting, 1)
axisstripchart(faithful$eruptions, 2)

# Dot-dash plot in lattice
# A useful panel.rug() lattice function used to create a dot-dash axis with a neat solution from
# Josh O’Brien to control the length of dash margin lines.

library(lattice)
x <- mtcars$wt
y <- mtcars$mpg
xyplot(y ~ x,
       xlab="Car weight (lb/1000)",
       ylab="Miles per gallon of fuel",
       par.settings = list(axis.line = list(col="transparent")),
       panel = function(x, y, ...) {
       panel.xyplot(x, y, col=1, pch=16)
       panel.rug(x, y, col=1,
                 x.units = rep("snpc", 2),
                 y.units = rep("snpc", 2), ...)})

# Dot-dash plot in ggplo2

library(ggplot2)
library(ggthemes)
ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    geom_rug() +
    theme_tufte(tick=F) +
    xlab("Car weight (lb/1000)") +
    ylab("Miles per gallon of fule") +
    theme(axis.title.x = element_text(vjust=-0.5),
          axis.title.y = element_text(vjust=1))


