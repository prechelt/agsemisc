\name{panel.bwstrip}
\alias{panel.bwstrip}
\title{Flexible panel.bwplot replacement}
\description{
Box plots with added stripplots, densityplots, mean/stderr marker etc.
}
\usage{
panel.bwstrip(x, y, groups, subscripts, pch, col, 
      box.ratio = 5, varwidth = FALSE, whiskerpos = 0.1, logbase,
      type="mean,mad,strip,N,grid",
      densityplot=expression(density(X,cut=2)), strip.limit=100, 
      seplines = NULL, N.label = "N=\% \n",
      extend = TRUE,
      levels.fos = NULL, ...)
}
\arguments{
\item{x}{
  the data, as in \code{\link{panel.bwplot}}}
\item{y}{
  the number of the box, as in \code{\link{panel.bwplot}}}
\item{groups}{
  a factor indicating a partitioning of the data \code{x}. Relevant for
  the \code{pch} and \code{col} arguments.}
\item{subscripts}{Argument internally used by Lattice to realize the
  \code{groups} functionality.}
\item{pch}{
  A integer vector, character vector or list that indicates the value
  to be used as pch (plot character) for the stripplot for each level of
  \code{groups}.
  You will need a list if you want to mix plot symbols (indicated by
  integers) with plot characters (indicated by characters).
  There is a simpler method to specify any of these cases, namely a
  single string with entries separated by commas. One-digit numeric
  entries will evaluate to a plot character, two-digit numeric entries
  will evaluate to an integer plot symbol.
  For instance, \code{"1,w,13,2,02"} will evaluate into
  \code{list("1", "w", 13, "2", 2)}. 
  Defaults to all \code{trellis.par.get("superpose.symbol")$pch}.
  Note that with \code{groups=gg} you can often use
  \code{pch=levels(gg)}, because Lattice will ignore all but the first
  character of a string.}
\item{col}{
  Analogous to pch, but indicating color.
  Integers indicate color numbers, strings indicate color names, both
  can be mixed in the comma-separated string format.
  Defaults to all \code{trellis.par.get("superpose.symbol")$col}.}
\item{box.ratio}{
  Like in panel.bwplot, but the different default value withstands the call
  default of 1 that is imposed by Lattice (as of R 2.2).}
\item{varwidth}{
  vary box thickness according to number of data values, 
  as in \code{\link{panel.bwplot}}}
\item{whiskerpos}{
  With large values in the range 1..Inf, \code{whiskerpos} is equivalent
  to the \code{coef} argument to \code{\link{panel.bwplot}} (or really
  \code{\link{boxplot.stats}}), i.e. each whisker is at the farthest data
  value that is at most \code{whiskerpos} times the interquartile range
  (or box width) away from the box. Only the values 1.5, 2 or 3 are common.
  In contrast, with small values \code{w} in the range 0..0.25, the
  whiskers will indicate the fixed quantiles \code{w} and \code{1-w}.
  This is easier to explain to non-statisticians and often more
  appropriate for larger samples.
  So \code{whiskerpos==0} will produce whiskers at the min and max of the
  data, the default will indicate the 10-percentile and the 90-percentile,
  and \code{whiskerpos==0.25} makes the whiskers disappear.}
\item{logbase}{
  An argument \code{logbase=b} indicates that
  the high-level plot is using a log scale axis to base \code{b} and hence
  the data is logarithmic rather than real and needs to be converted back
  before computing mean, interpolating quantiles etc.}
\item{type}{
  Declares which boxplot elements to include in the plot. Is either a
  comma-separated string of element names (as shown in the default) or a
  vector of such names.
  The elements have the following meaning: 
  \code{mean} plots something like --M-- indicating the mean and its
    standard error.
  \code{mad} will indicate the stderror of the median (median absolute 
    deviation, as computed by \code{\link{mad}} divided by sqrt(n))
    as a line left and right of the median dot.
  \code{strip} will produce a stripplot of the individual data points,
    scattered vertically to make similar values more visible.
  \code{density} will add a densityplot and a support line (extending
    along the range of the data). The plot can be customized via the
    \code{densityplot} argument.
  \code{N} will indicate the number of datapoints according to the
    \code{N.label} argument.
  \code{grid} will draw dotted vertical lines aligned with x-axis labels.
  Elements not mentioned will be left out of the plot.
  The box and median dot are always included (this
  is a boxplot, after all), the whiskers can be suppressed by
  \code{whiskerpos=0.25}.}
\item{densityplot}{
  Relevant if \code{"density"} is mentioned in the \code{type}
  argument. Must be an expression describing a call to
  \code{\link{density}} that concerns the data vector \code{X} (an
  uppercase x!), which will be the data for the current boxplot for each
  evaluation of the expression.
  If a densityplot appears, the boxplot will not be color-filled.}
\item{strip.limit}{
  If \code{T}, will reduce the stripplot to only the outliers, i.e., the
  values beyond the whiskers.
  If an integer, will suppress the stripplot entirely if there are more
  than this many values in the current boxplot.}
\item{seplines}{
  A vector of vertical positions where horizontal lines will be drawn
  to separate the boxplots into groups. Position 1.5, 2.5 etc. is above
  the lowest, second-lowest boxplot etc.}
\item{N.label}{
  A string such as "% data points ". The "%" will be replaced by the
  number of values underlying the boxplot and the resulting string is
  printed at the right of the plot iff \code{N} is mentioned in the
  \code{type} argument.
  Use trailing blanks and newlines to adjust positioning.}
\item{extend}{
  If TRUE, will print to console some statistics for each sample:
  the quantiles (0, 0.25, 0.5, 0.75,, 1), mean, quartile ratio (or at least
  interquartile range) and the number of data points.
  If \code{extend} is a function, it will be called with four arguments:
  data vector x, current y, groups, subscripts.}
\item{levels.fos}{
  weird stuff, but means the same as in \code{\link{panel.bwplot}}}
\item{...}{
  all other arguments will be ignored.}
}
\details{
A lattice panel function to be used with bwplot.
Can draw a boxplot plus stripplot plus densityplot, indicate groups,
mark the mean and its stderror, report N, and more.
Graphical parameters are controlled by the \code{trellis.par.set} parameters
\code{box.rectangle, box.umbrella, superpose.symbol} (which is
non-standard), and \code{reference.line}.
The \code{horizontal=F} option available in \code{panel.bwplot} is not
supported here.
}
\author{Lutz Prechelt \email{prechelt@inf.fu-berlin.de}}
\seealso{
\code{\link{a.resetplotparams}},
\code{\link{plotf}},
\code{\link{panel.xy}}.
}
\examples{
# set  grid.prompt(TRUE)  to see each plot separately (click graphics window)
data(iris)
a.resetplotparams()
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip))
# A plot including a density plot:
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip,
             type="mean,strip,density"))
# A customized plot:
print(bwplot(~Sepal.Length, data=iris, panel=panel.bwstrip, 
             groups=Species, pch=levels(iris$Species), strip.limit=200,
             type="mean,strip,density", 
             densityplot=expression(density(X, cut=1))))
# A conventional-style plot:
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip,
             type="mean,strip,grid", strip.limit=TRUE, whiskerpos=1.5,
             densityplot=expression(density(X, cut=1))))
# A plot showing some other features:
print(bwplot(cut(Sepal.Width,4)~Sepal.Length, data=iris, panel=panel.bwstrip,
             groups=Species, varwidth=TRUE, box.ratio=20, 
             which="strip,N", strip.limit=50, pch="1,2,3"))
}
\keyword{aplot} 
