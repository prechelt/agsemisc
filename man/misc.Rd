\name{misc helpers}
\alias{eqc}
\alias{grep.b}
\alias{grep.s}
\alias{or.else}
\alias{orderavg}
\alias{tableNA}
\alias{printn}
\alias{tracebck}
\title{Misc R helper functions}
\description{
\code{eqc(x, number=4, overlap=1/sqrt(length(x)))}
  an abbreviation for \code{\link{equal.count}} with useful defaults.
  Often useful for Lattice plots.

\code{grep.b(pattern, x)} performs a \code{\link{grep}}, but returns the
  result as a logical (boolean, thus the .b) vector along \code{x}
  rather than as an integer vector indices. Often useful for Lattice
  \code{subset} calls.

\code{grep.s(pattern, x)} performs \code{grep(pattern, x, value=TRUE)} and
thus returns the matched strings rather than their indices.

\code{orderavg(x, by)} orders the observations from vector \code{x}
  using the equal-weighted ranking criteria given in matrix \code{by} 
  (which has \code{length(x)} rows and \code{n} colums), a \code{by}
  vector is coerced. 
  The ranks computed from each matrix column are summed row-wise,
  the resulting vector is sorted according to these rank sums, and returned.
  This function can be used to pair elements from two vectors (by ranking
  them both by equivalent criteria).

\code{tableNA} abbreviation for \code{\link{table}} with an additional
  argument \code{exclude = NULL} so that \code{NA} and \code{NaN} values
  are tabulated as well.

\code{or.else(x, alternative = 0)} returns \code{x} where available
  and \code{alternative} where \code{is.na(x)}.
  \code{alternative} can be a scalar or vector and should have the same
  mode as \code{x}.

\code{printn(x, digits)} prints name and value of \code{x}. If
  the optional argument \code{digits} is used, \code{x} will be coerced to
  numeric and formatted with \code{digits} digits precision.
  Useful for quick-and-dirty debugging output.

\code{tracebck()} is like \code{\link{traceback}} except that it returns
  (rather than prints) only the first line of each frame. This is useful
  because the argument lists of calls often contain large data objects
  which clutter the output of \code{traceback} and make it very
  difficult to read.
}
\details{
  Type the name of a function to see its source code for details.
}
\author{Lutz Prechelt \email{prechelt@inf.fu-berlin.de}}
\seealso{
\code{\link{equal.count}},
\code{\link{grep}},
\code{\link{order}},
\code{\link{ifelse}},
\code{\link{table}},
\code{\link{traceback}}.
}
\examples{
\dontrun{plot(rnorm(8)~runif(8),xlim=c(10,NA))}
\dontrun{traceback()}
\dontrun{tracebck()}

data(iris)
xyplot(Sepal.Width ~ Sepal.Length | eqc(Sepal.Length),
       subset=grep.b("v",Species), data=iris)

x = c(4,9,NA,4,4,27,NA,27)
table(or.else(x,88))
table(x)
tableNA(x)

printn(levels(iris$Species))
}
\keyword{manip} 
