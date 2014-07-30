\name{plothelpers}
\alias{a.resetplotparams}
\alias{plotfit}
\alias{prepanel.0}
\title{Plot helper functions}
\description{
  \code{a.resetplotparams()} sets colors and plotting parameters suitable
  for document production.
  
  \code{plotfit(fit, ...)} plots an \code{\link{lm}} object
  using \code{mfrow=c(2,3)}
  
  \code{prepanel.0} Lattice \code{prepanel} function that forces that zero be
  included on both axes. 
  Does nothing for non-numeric axes (such as the factor axis in \code{bwplot}).
}
\details{
  Type the name of a function to see its source code for details.
}
\author{Lutz Prechelt \email{prechelt@inf.fu-berlin.de}}
\seealso{
\code{\link{trellis.par.set}},
\code{\link{plot.lm}},
\code{\link{Lattice}},
\code{\link{prepanel.lmline}}.
}
\examples{
data(iris)
a.resetplotparams()
print(bwplot(Species~Sepal.Length, data=iris, panel=panel.bwstrip,
             prepanel=prepanel.0))
plotfit(lm(Sepal.Length~Sepal.Width, data=iris))
}
\keyword{dplot} 
\keyword{color} 
