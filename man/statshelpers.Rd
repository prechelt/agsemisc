\name{statshelpers}
\alias{a.findcorrelations}
\alias{a.iqr}
\alias{a.qr}
\alias{a.proportion.test}
\alias{a.printextremes}
\title{Simple stats and tabulation helper functions}
\description{
  \code{a.iqr(x)} interquartile range of numeric vector
  
  \code{a.qr(x)} ratio of 3rd to 1st quartile of numeric vector

  \code{a.proportion.test(x1,x2, y1,y2, totals=FALSE)} 
  compares x1/x2 to y1/y2 using fisher.test and prints the result.
  totals=TRUE means the supplied x2 is in fact (x1+x2); 
  ditto for y2.

  \code{a.findcorrelations(df, vars1=names(df), vars2=vars1, min.cor=0.5)} 
  computes corrrelation (of values and of ranks) for each pair of variables 
  from (vars1,vars2), sorts them by size and returns the large ones
  (along with descriptive names) as a vector. Ignores NAs.

  \code{a.printextremes(df, vars, largest=5, showalso=NULL} 
  given variable names a,b,c from dataframe df, prints the
  tuples a,b,c with the 5 largest values of a. Ditto for b and for c.
  largest can be a vector (along vars) and negative values print
  smallest instead of largest. Factors are moved from vars to showalso.
}
\details{
  Type the name of a function to see its source code for details.
}
\author{Lutz Prechelt \email{prechelt@inf.fu-berlin.de}}
\seealso{
\code{\link{cor}},
\code{\link{rank}},
\code{\link{quantile}},
\code{\link{summary}}.
}
\examples{
set.seed(17)
base = rnorm(100)
a = floor(base*10)
b = floor(a+runif(100, -10, 11))
c=floor(base)
d=ordered(floor(b/8))  # allows for rank correlation only
df=data.frame(a=a,b=b,c=c,d=d)

a.findcorrelations(df,min.cor=0.85)

a.printextremes(iris, vars=c("Species", "Sepal.Length", "Petal.Width"), 
                largest=c(3, -4, -5), showalso=c("Petal.Length"))

}
\keyword{quantile} 
\keyword{quartile} 
\keyword{correlation} 
\keyword{rank} 
\keyword{summary} 
