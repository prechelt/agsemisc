\name{panel.xy}
\alias{panel.xy}
\alias{panel.lminterval}
\title{Flexible panel.xyplot replacement}
\description{
  \code{panel.xy} is used like \code{\link{panel.xyplot}} but offers more
  features. In particular, it can add an \code{lqs} resistant regression
  line besides a normal one, can plot a prediction interval around the
  standard regression line, can add text indicating correlation and
  number of data points, and automatically uses different colors and
  line styles.
}
\usage{
panel.xy(x, y, type = "p,r,r.pred,r=,N=,grid",
         r.min = 0.5, level = 0.8, unicolor = FALSE, ...)
}
\arguments{
\item{x}{
  Vector of x coordindates for the plot.}
\item{y}{
  Vector of x coordindates for the plot. Pairs (x,y) containing
  NAs will be filtered out.}
\item{type}{
  A character vector (or single comma-separated string) of options to
  use for plotting.
  Entries \code{"p", "l", "b", "o", "h", "s", "S"} are handled just as
    \code{\link{plot}} or \code{\link{panel.xyplot}} would 
    (namely as points, lines, both, both overplotted, 
    histogram lines, stair steps, stair steps with vertical preference).
  \code{"g"} adds a coordinate grid via \code{panel.grid}.
  \code{"r"} adds an \code{lm} regression line. See \code{r.min} and
    \code{unicolor} for details.
    The line is suppressed if there are less than 8 points.
  \code{"r.pred"} adds a prediction interval around the \code{"r"}
    line. Implies \code{"r"}. See \code{level} for details.
  \code{"r.conf"} adds a confidence interval around the \code{"r"}
    line. This concerns the regression line itself rather than the
    predictions it makes and is not often of much interest. Implies
    \code{"r"}.
    \code{level} applies just like it does for \code{"r.pred"}.
  \code{"lqs"} adds an \code{lqs} resistant regression line.
    Roughly speaking, this produces approximately the best regression line
    that is possible if it is allowed to throw the most difficult 50\% of
    the points away. The line is suppressed if there are less than 8 points.
  \code{"smooth", "loess", "lowess"} are all synonymous and add a
    locally weighted regression via \code{panel.loess}, whose
    configuration parameters will be passed to the call if given.
    The line is suppressed if there are less than 8 points.
  \code{"ab"} adds an arbitrary line (described by parameters \code{a=}
    and \code{b=}) via \code{panel.ab}. This does currently not work due
    to parameter name clashes.
  \code{"rug"} adds a rug plot via \code{panel.rug}.
  \code{"cor"} prints the correlation coefficient computed by
    \code{\link{cor}} in the lower right corner of the plot.
  \code{"N"} prints the number of non-NA data points in the lower right
    corner of the plot.
  \code{"v"} (verbose) prints various statistics regarding the plot to
    the console.
  }
\item{r.min}{
  Even if \code{type "r"} is requested, the regression line
  will appear only if \code{abs(cor(x,y) >= r.min)}.}
\item{level}{
  The confidence level of the intervals plotted by \code{type "r.conf"}
  and \code{type "r.pred"}.}
\item{unicolor}{
  The colors used for the lines drawn by
  types \code{"r", "r.pred", "r.conf", "loess"} are normally taken from
  \code{trellis.par.get("regression.line")} 
  (as introduced by \code{a.resetplotparams}). 
  However, if you use \code{xyplot} with 
  \code{panel=panel.superpose, panel.groups=panel.xy}, you must specify
  \code{unicolor=T}. The regression lines will then be plotted in the
  style given by \code{trellis.par.get("superpose.line")} according to
  the respective group. }
\item{\dots}{Further parameters as needed for instance by 
  \code{panel.loess} and \code{lqs}.}
}
\details{
  The types \code{"p", "l", "b", "o", "h", "s", "S"} are in fact
  processed by \code{panel.xyplot}.
  Specifying \code{col, lty, lwd} will not work, as there are calls that
  include both \code{...} and some of these.
}
\author{Lutz Prechelt, prechelt@inf.fu-berlin.de}
\seealso{
  \code{\link{a.resetplotparams}},
  \code{\link{trellis.par.get}},
  \code{\link{panel.xyplot}},
  \code{\link{panel.superpose}},
  \code{\link{panel.loess}},
  \code{\link{lm}},
  \code{\link{lqs}}.
}
\examples{
# set  grid.prompt(TRUE)  to see each plot separately (click graphics window)
data(iris)
a.resetplotparams()
print(xyplot(Sepal.Width ~ Sepal.Length|Species, data=iris,
             panel=panel.xy, type="p,grid,v,lqs,r.pred,loess"))
print(xyplot(Sepal.Width ~ Sepal.Length, data=iris, groups=Species,
             panel=panel.superpose, panel.groups=panel.xy,
             type=c("p","grid","v","loess"), unicolor=TRUE))
}
\keyword{aplot}
