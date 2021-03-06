hhist                 package:graphics                  R Documentation

Histograms

Description:

     The generic function ‘hist’ computes a histogram of the given data
     values.  If ‘plot = TRUE’, the resulting object of class
     ‘"histogram"’ is plotted by ‘plot.histogram’, before it is
     returned.

Usage:

     hist(x, ...)
     
     ## Default S3 method:
     hist(x, breaks = "Sturges",
          freq = NULL, probability = !freq,
          include.lowest = TRUE, right = TRUE,
          density = NULL, angle = 45, col = NULL, border = NULL,
          main = paste("Histogram of" , xname),
          xlim = range(breaks), ylim = NULL,
          xlab = xname, ylab,
          axes = TRUE, plot = TRUE, labels = FALSE,
          nclass = NULL, warn.unused = TRUE, ...)
	
Arguments: 

       x: a vector of values for which the histogram is desired.

  breaks: one of:

            • a vector giving the breakpoints between histogram cells,

            • a function to compute the vector of breakpoints,

            • a single number giving the number of cells for the
              histogram,

            • a character string naming an algorithm to compute the
              number of cells (see ‘Details’),

            • a function to compute the number of cells.

          In the last three cases the number is a suggestion only; as
          the breakpoints will be set to ‘pretty’ values, the number is
          limited to ‘1e6’ (with a warning if it was larger).  If
          ‘breaks’ is a function, the ‘x’ vector is supplied to it as
          the only argument (and the number of breaks is only limited
          by the amount of available memory).

    freq: logical; if ‘TRUE’, the histogram graphic is a representation
          of frequencies, the ‘counts’ component of the result; if
          ‘FALSE’, probability densities, component ‘density’, are
          plotted (so that the histogram has a total area of one).
          Defaults to ‘TRUE’ _if and only if_ ‘breaks’ are equidistant
          (and ‘probability’ is not specified).

probability: an _alias_ for ‘!freq’, for S compatibility.

include.lowest: logical; if ‘TRUE’, an ‘x[i]’ equal to the ‘breaks’
          value will be included in the first (or last, for ‘right =
          FALSE’) bar.  This will be ignored (with a warning) unless
          ‘breaks’ is a vector.

   right: logical; if ‘TRUE’, the histogram cells are right-closed
          (left open) intervals.

 density: the density of shading lines, in lines per inch.  The default
          value of ‘NULL’ means that no shading lines are drawn.
          Non-positive values of ‘density’ also inhibit the drawing of
          shading lines.

   angle: the slope of shading lines, given as an angle in degrees
          (counter-clockwise).

     col: a colour to be used to fill the bars.  The default of ‘NULL’
          yields unfilled bars.

  border: the color of the border around the bars.  The default is to
          use the standard foreground color.

main, xlab, ylab: these arguments to ‘title’ have useful defaults here.

xlim, ylim: the range of x and y values with sensible defaults.  Note
          that ‘xlim’ is _not_ used to define the histogram (breaks),
          but only for plotting (when ‘plot = TRUE’).

    axes: logical.  If ‘TRUE’ (default), axes are draw if the plot is
          drawn.

    plot: logical.  If ‘TRUE’ (default), a histogram is plotted,
          otherwise a list of breaks and counts is returned.  In the
          latter case, a warning is used if (typically graphical)
          arguments are specified that only apply to the ‘plot = TRUE’
          case.

  labels: logical or character string.  Additionally draw labels on top
          of bars, if not ‘FALSE’; see ‘plot.histogram’.

  nclass: numeric (integer).  For S(-PLUS) compatibility only, ‘nclass’
          is equivalent to ‘breaks’ for a scalar or character argument.

warn.unused: logical.  If ‘plot = FALSE’ and ‘warn.unused = TRUE’, a
          warning will be issued when graphical parameters are passed
          to ‘hist.default()’.

     ...: further arguments and graphical parameters passed to
          ‘plot.histogram’ and thence to ‘title’ and ‘axis’ (if ‘plot =
          TRUE’).
 	
Details:

     The definition of _histogram_ differs by source (with
     country-specific biases).  R's default with equi-spaced breaks
     (also the default) is to plot the counts in the cells defined by
     ‘breaks’.  Thus the height of a rectangle is proportional to the
     number of points falling into the cell, as is the area _provided_
     the breaks are equally-spaced.

     The default with non-equi-spaced breaks is to give a plot of area
     one, in which the _area_ of the rectangles is the fraction of the
     data points falling in the cells.

     If ‘right = TRUE’ (default), the histogram cells are intervals of
     the form ‘(a, b]’, i.e., they include their right-hand endpoint,
     but not their left one, with the exception of the first cell when
     ‘include.lowest’ is ‘TRUE’.

     For ‘right = FALSE’, the intervals are of the form ‘[a, b)’, and
     ‘include.lowest’ means ‘_include highest_’.

     A numerical tolerance of 1e-7 times the median bin size (for more
     than four bins, otherwise the median is substituted) is applied
     when counting entries on the edges of bins.  This is not included
     in the reported ‘breaks’ nor in the calculation of ‘density’.

     The default for ‘breaks’ is ‘"Sturges"’: see ‘nclass.Sturges’.
     Other names for which algorithms are supplied are ‘"Scott"’ and
     ‘"FD"’ / ‘"Freedman-Diaconis"’ (with corresponding functions
     ‘nclass.scott’ and ‘nclass.FD’).  Case is ignored and partial
     matching is used.  Alternatively, a function can be supplied which
     will compute the intended number of breaks or the actual
     breakpoints as a function of ‘x’.

Value:

     an object of class ‘"histogram"’ which is a list with components:

  breaks: the n+1 cell boundaries (= ‘breaks’ if that was a vector).
          These are the nominal breaks, not with the boundary fuzz.

  counts: n integers; for each cell, the number of ‘x[]’ inside.

 density: values f^(x[i]), as estimated density values. If
          ‘all(diff(breaks) == 1)’, they are the relative frequencies
          ‘counts/n’ and in general satisfy sum[i; f^(x[i])
          (b[i+1]-b[i])] = 1, where b[i] = ‘breaks[i]’.

    mids: the n cell midpoints.

   xname: a character string with the actual ‘x’ argument name.

equidist: logical, indicating if the distances between ‘breaks’ are all
          the same.

References:

     Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) _The New S
     Language_.  Wadsworth & Brooks/Cole.

     Venables, W. N. and Ripley. B. D. (2002) _Modern Applied
     Statistics with S_.  Springer.

See Also:

     ‘nclass.Sturges’, ‘stem’, ‘density’, ‘truehist’ in package ‘MASS’.

     Typical plots with vertical bars are _not_ histograms.  Consider
     ‘barplot’ or ‘plot(*, type = "h")’ for such bar plots.

Examples:

     op <- par(mfrow = c(2, 2))
     hist(islands)
     utils::str(hist(islands, col = "gray", labels = TRUE))
     
     hist(sqrt(islands), breaks = 12, col = "lightblue", border = "pink")
     ##-- For non-equidistant breaks, counts should NOT be graphed unscaled:
     r <- hist(sqrt(islands), breaks = c(4*0:5, 10*3:5, 70, 100, 140),
               col = "blue1")
     text(r$mids, r$density, r$counts, adj = c(.5, -.5), col = "blue3")
     sapply(r[2:3], sum)
     sum(r$density * diff(r$breaks)) # == 1
     lines(r, lty = 3, border = "purple") # -> lines.histogram(*)
     par(op)
     
     require(utils) # for str
     str(hist(islands, breaks = 12, plot =  FALSE)) #-> 10 (~= 12) breaks
     str(hist(islands, breaks = c(12,20,36,80,200,1000,17000), plot = FALSE))
     
     hist(islands, breaks = c(12,20,36,80,200,1000,17000), freq = TRUE,
          main = "WRONG histogram") # and warning
     
     ## Extreme outliers; the "FD" rule would take very large number of 'breaks':
     XXL <- c(1:9, c(-1,1)*1e300)
     hh <- hist(XXL, "FD") # did not work in R <= 3.4.1; now gives warning
     ## pretty() determines how many counts are used (platform dependently!):
     length(hh$breaks) ## typically 1 million -- though 1e6 was "a suggestion only"
     
     require(stats)
     set.seed(14)
     x <- rchisq(100, df = 4)
     
     ## Comparing data with a model distribution should be done with qqplot()!
     qqplot(x, qchisq(ppoints(x), df = 4)); abline(0, 1, col = 2, lty = 2)
     
     ## if you really insist on using hist() ... :
     hist(x, freq = FALSE, ylim = c(0, 0.2))
     curve(dchisq(x, df = 4), col = 2, lty = 2, lwd = 2, add = TRUE)
     
#ist                 package:graphics                  R Documentation

Histograms

Description:

     The generic function ‘hist’ computes a histogram of the given data
     values.  If ‘plot = TRUE’, the resulting object of class
     ‘"histogram"’ is plotted by ‘plot.histogram’, before it is
     returned.

Usage:

     hist(x, ...)
     
     ## Default S3 method:
     hist(x, breaks = "Sturges",
          freq = NULL, probability = !freq,
          include.lowest = TRUE, right = TRUE,
          density = NULL, angle = 45, col = NULL, border = NULL,
          main = paste("Histogram of" , xname),
          xlim = range(breaks), ylim = NULL,
          xlab = xname, ylab,
          axes = TRUE, plot = TRUE, labels = FALSE,
          nclass = NULL, warn.unused = TRUE, ...)
	
Arguments: 

       x: a vector of values for which the histogram is desired.

  breaks: one of:

            • a vector giving the breakpoints between histogram cells,

            • a function to compute the vector of breakpoints,

            • a single number giving the number of cells for the
              histogram,

            • a character string naming an algorithm to compute the
              number of cells (see ‘Details’),

            • a function to compute the number of cells.

          In the last three cases the number is a suggestion only; as
          the breakpoints will be set to ‘pretty’ values, the number is
          limited to ‘1e6’ (with a warning if it was larger).  If
          ‘breaks’ is a function, the ‘x’ vector is supplied to it as
          the only argument (and the number of breaks is only limited
          by the amount of available memory).

    freq: logical; if ‘TRUE’, the histogram graphic is a representation
          of frequencies, the ‘counts’ component of the result; if
          ‘FALSE’, probability densities, component ‘density’, are
          plotted (so that the histogram has a total area of one).
          Defaults to ‘TRUE’ _if and only if_ ‘breaks’ are equidistant
          (and ‘probability’ is not specified).

probability: an _alias_ for ‘!freq’, for S compatibility.

include.lowest: logical; if ‘TRUE’, an ‘x[i]’ equal to the ‘breaks’
          value will be included in the first (or last, for ‘right =
          FALSE’) bar.  This will be ignored (with a warning) unless
          ‘breaks’ is a vector.

   right: logical; if ‘TRUE’, the histogram cells are right-closed
          (left open) intervals.

 density: the density of shading lines, in lines per inch.  The default
          value of ‘NULL’ means that no shading lines are drawn.
          Non-positive values of ‘density’ also inhibit the drawing of
          shading lines.

   angle: the slope of shading lines, given as an angle in degrees
          (counter-clockwise).

     col: a colour to be used to fill the bars.  The default of ‘NULL’
          yields unfilled bars.

  border: the color of the border around the bars.  The default is to
          use the standard foreground color.

main, xlab, ylab: these arguments to ‘title’ have useful defaults here.

xlim, ylim: the range of x and y values with sensible defaults.  Note
          that ‘xlim’ is _not_ used to define the histogram (breaks),
          but only for plotting (when ‘plot = TRUE’).

    axes: logical.  If ‘TRUE’ (default), axes are draw if the plot is
          drawn.

    plot: logical.  If ‘TRUE’ (default), a histogram is plotted,
          otherwise a list of breaks and counts is returned.  In the
          latter case, a warning is used if (typically graphical)
          arguments are specified that only apply to the ‘plot = TRUE’
          case.

  labels: logical or character string.  Additionally draw labels on top
          of bars, if not ‘FALSE’; see ‘plot.histogram’.

  nclass: numeric (integer).  For S(-PLUS) compatibility only, ‘nclass’
          is equivalent to ‘breaks’ for a scalar or character argument.

warn.unused: logical.  If ‘plot = FALSE’ and ‘warn.unused = TRUE’, a
          warning will be issued when graphical parameters are passed
          to ‘hist.default()’.

     ...: further arguments and graphical parameters passed to
          ‘plot.histogram’ and thence to ‘title’ and ‘axis’ (if ‘plot =
          TRUE’).
 	
Details:

     The definition of _histogram_ differs by source (with
     country-specific biases).  R's default with equi-spaced breaks
     (also the default) is to plot the counts in the cells defined by
     ‘breaks’.  Thus the height of a rectangle is proportional to the
     number of points falling into the cell, as is the area _provided_
     the breaks are equally-spaced.

     The default with non-equi-spaced breaks is to give a plot of area
     one, in which the _area_ of the rectangles is the fraction of the
     data points falling in the cells.

     If ‘right = TRUE’ (default), the histogram cells are intervals of
     the form ‘(a, b]’, i.e., they include their right-hand endpoint,
     but not their left one, with the exception of the first cell when
     ‘include.lowest’ is ‘TRUE’.

     For ‘right = FALSE’, the intervals are of the form ‘[a, b)’, and
     ‘include.lowest’ means ‘_include highest_’.

     A numerical tolerance of 1e-7 times the median bin size (for more
     than four bins, otherwise the median is substituted) is applied
     when counting entries on the edges of bins.  This is not included
     in the reported ‘breaks’ nor in the calculation of ‘density’.

     The default for ‘breaks’ is ‘"Sturges"’: see ‘nclass.Sturges’.
     Other names for which algorithms are supplied are ‘"Scott"’ and
     ‘"FD"’ / ‘"Freedman-Diaconis"’ (with corresponding functions
     ‘nclass.scott’ and ‘nclass.FD’).  Case is ignored and partial
     matching is used.  Alternatively, a function can be supplied which
     will compute the intended number of breaks or the actual
     breakpoints as a function of ‘x’.

Value:

     an object of class ‘"histogram"’ which is a list with components:

  breaks: the n+1 cell boundaries (= ‘breaks’ if that was a vector).
          These are the nominal breaks, not with the boundary fuzz.

  counts: n integers; for each cell, the number of ‘x[]’ inside.

 density: values f^(x[i]), as estimated density values. If
          ‘all(diff(breaks) == 1)’, they are the relative frequencies
          ‘counts/n’ and in general satisfy sum[i; f^(x[i])
          (b[i+1]-b[i])] = 1, where b[i] = ‘breaks[i]’.

    mids: the n cell midpoints.

   xname: a character string with the actual ‘x’ argument name.

equidist: logical, indicating if the distances between ‘breaks’ are all
          the same.

References:

     Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) _The New S
     Language_.  Wadsworth & Brooks/Cole.

     Venables, W. N. and Ripley. B. D. (2002) _Modern Applied
     Statistics with S_.  Springer.

See Also:

     ‘nclass.Sturges’, ‘stem’, ‘density’, ‘truehist’ in package ‘MASS’.

     Typical plots with vertical bars are _not_ histograms.  Consider
     ‘barplot’ or ‘plot(*, type = "h")’ for such bar plots.

Examples:

     op <- par(mfrow = c(2, 2))
     hist(islands)
     utils::str(hist(islands, col = "gray", labels = TRUE))
     
     hist(sqrt(islands), breaks = 12, col = "lightblue", border = "pink")
     ##-- For non-equidistant breaks, counts should NOT be graphed unscaled:
     r <- hist(sqrt(islands), breaks = c(4*0:5, 10*3:5, 70, 100, 140),
               col = "blue1")
     text(r$mids, r$density, r$counts, adj = c(.5, -.5), col = "blue3")
     sapply(r[2:3], sum)
     sum(r$density * diff(r$breaks)) # == 1
     lines(r, lty = 3, border = "purple") # -> lines.histogram(*)
     par(op)
     
     require(utils) # for str
     str(hist(islands, breaks = 12, plot =  FALSE)) #-> 10 (~= 12) breaks
     str(hist(islands, breaks = c(12,20,36,80,200,1000,17000), plot = FALSE))
     
     hist(islands, breaks = c(12,20,36,80,200,1000,17000), freq = TRUE,
          main = "WRONG histogram") # and warning
     
     ## Extreme outliers; the "FD" rule would take very large number of 'breaks':
     XXL <- c(1:9, c(-1,1)*1e300)
     hh <- hist(XXL, "FD") # did not work in R <= 3.4.1; now gives warning
     ## pretty() determines how many counts are used (platform dependently!):
     length(hh$breaks) ## typically 1 million -- though 1e6 was "a suggestion only"
     
     require(stats)
     set.seed(14)
     x <- rchisq(100, df = 4)
     
     ## Comparing data with a model distribution should be done with qqplot()!
     qqplot(x, qchisq(ppoints(x), df = 4)); abline(0, 1, col = 2, lty = 2)
     
     ## if you really insist on using hist() ... :
     hist(x, freq = FALSE, ylim = c(0, 0.2))
     curve(dchisq(x, df = 4), col = 2, lty = 2, lwd = 2, add = TRUE)
     
#
