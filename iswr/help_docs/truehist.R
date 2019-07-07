truehist                 package:MASS                  R Documentation

Plot a Histogram

Description:

     Creates a histogram on the current graphics device.

Usage:

     truehist(data, nbins = "Scott", h, x0 = -h/1000,
              breaks, prob = TRUE, xlim = range(breaks),
              ymax = max(est), col = "cyan",
              xlab = deparse(substitute(data)), bty = "n", ...)
	
Arguments: 

    data: numeric vector of data for histogram.  Missing values (‘NA’s)
          are allowed and omitted.

   nbins: The suggested number of bins.  Either a positive integer, or
          a character string naming a rule: ‘"Scott"’ or
          ‘"Freedman-Diaconis"’ or ‘"FD"’.  (Case is ignored.)

       h: The bin width, a strictly positive number (takes precedence
          over ‘nbins’).

      x0: Shift for the bins - the breaks are at ‘x0 + h * (..., -1, 0,
          1, ...)’

  breaks: The set of breakpoints to be used. (Usually omitted, takes
          precedence over ‘h’ and ‘nbins’).

    prob: If true (the default) plot a true histogram. The vertical
          axis has a _relative frequency density_ scale, so the product
          of the dimensions of any panel gives the relative frequency.
          Hence the total area under the histogram is 1 and it is
          directly comparable with most other estimates of the
          probability density function. If false plot the counts in the
          bins.

    xlim: The limits for the x-axis.

    ymax: The upper limit for the y-axis.

     col: The colour for the bar fill: the default is colour 5 in the
          default R palette.

    xlab: label for the plot x-axis. By default, this will be the name
          of ‘data’.

     bty: The box type for the plot - defaults to none.

     ...: additional arguments to ‘rect’ or ‘plot’.
 	
Details:

     This plots a true histogram, a density estimate of total area 1.
     If ‘breaks’ is specified, those breakpoints are used. Otherwise if
     ‘h’ is specified, a regular grid of bins is used with width ‘h’.
     If neither ‘breaks’ nor ‘h’ is specified, ‘nbins’ is used to
     select a suitable ‘h’.

Side Effects:

     A histogram is plotted on the current device.

References:

     Venables, W. N. and Ripley, B. D. (2002) _Modern Applied
     Statistics with S._ Fourth edition.  Springer.

See Also:

     ‘hist’

