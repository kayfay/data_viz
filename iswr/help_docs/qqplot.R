qqnorm                  package:stats                  R Documentation

Quantile-Quantile Plots

Description:

     ‘qqnorm’ is a generic function the default method of which
     produces a normal QQ plot of the values in ‘y’.  ‘qqline’ adds a
     line to a “theoretical”, by default normal, quantile-quantile plot
     which passes through the ‘probs’ quantiles, by default the first
     and third quartiles.

     ‘qqplot’ produces a QQ plot of two datasets.

     Graphical parameters may be given as arguments to ‘qqnorm’,
     ‘qqplot’ and ‘qqline’.

Usage:

     qqnorm(y, ...)
     ## Default S3 method:
     qqnorm(y, ylim, main = "Normal Q-Q Plot",
            xlab = "Theoretical Quantiles", ylab = "Sample Quantiles",
            plot.it = TRUE, datax = FALSE, ...)
     
     qqline(y, datax = FALSE, distribution = qnorm,
            probs = c(0.25, 0.75), qtype = 7, ...)
     
     qqplot(x, y, plot.it = TRUE, xlab = deparse(substitute(x)),
            ylab = deparse(substitute(y)), ...)
	
Arguments: 

       x: The first sample for ‘qqplot’.

       y: The second or only data sample.

xlab, ylab, main: plot labels.  The ‘xlab’ and ‘ylab’ refer to the y
          and x axes respectively if ‘datax = TRUE’.

 plot.it: logical. Should the result be plotted?

   datax: logical. Should data values be on the x-axis?

distribution: quantile function for reference theoretical distribution.

   probs: numeric vector of length two, representing probabilities.
          Corresponding quantile pairs define the line drawn.

   qtype: the ‘type’ of quantile computation used in ‘quantile’.

ylim, ...: graphical parameters.
 	
Value:

     For ‘qqnorm’ and ‘qqplot’, a list with components

       x: The x coordinates of the points that were/would be plotted

       y: The original ‘y’ vector, i.e., the corresponding y
          coordinates _including ‘NA’s_.

References:

     Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) _The New S
     Language_.  Wadsworth & Brooks/Cole.

See Also:

     ‘ppoints’, used by ‘qqnorm’ to generate approximations to expected
     order statistics for a normal distribution.

Examples:

     require(graphics)
     
     y <- rt(200, df = 5)
     qqnorm(y); qqline(y, col = 2)
     qqplot(y, rt(300, df = 5))
     
     qqnorm(precip, ylab = "Precipitation [in/yr] for 70 US cities")
     
     ## "QQ-Chisquare" : --------------------------
     y <- rchisq(500, df = 3)
     ## Q-Q plot for Chi^2 data against true theoretical distribution:
     qqplot(qchisq(ppoints(500), df = 3), y,
            main = expression("Q-Q plot for" ~~ {chi^2}[nu == 3]))
     qqline(y, distribution = function(p) qchisq(p, df = 3),
            prob = c(0.1, 0.6), col = 2)
     mtext("qqline(*, dist = qchisq(., df=3), prob = c(0.1, 0.6))")
     
#
